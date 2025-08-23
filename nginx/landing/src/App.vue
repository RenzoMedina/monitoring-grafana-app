<template>
  <div id="app" class="min-h-screen bg-port-50">
    <!-- Header -->
    <header class="bg-white border-b border-port-200 shadow-sm sticky top-0 z-50">
      <div class="px-6 py-4">
        <div class="flex items-center justify-between">
          <!-- Logo and Brand -->
          <div class="flex items-center space-x-4">
            <div class="flex items-center space-x-3">
              <div class="w-10 h-10 bg-gradient-to-br from-ocean-500 to-primary-600 rounded-xl flex items-center justify-center">
                <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
                    d="M13 10V3L4 14h7v7l9-11h-7z"/>
                </svg>
              </div>
              <div>
                <h1 class="text-xl font-bold text-port-900">PortTrack</h1>
                <p class="text-xs text-port-500">Sistema de Navegación Portuaria</p>
              </div>
            </div>
          </div>

          <!-- Navigation -->
          <nav class="hidden md:flex space-x-1">
            <button 
              v-for="item in navigation" 
              :key="item.id"
              @click="currentView = item.id"
              :class="[
                'px-4 py-2 rounded-lg text-sm font-medium transition-all duration-200',
                currentView === item.id 
                  ? 'bg-primary-100 text-primary-700' 
                  : 'text-port-600 hover:text-port-900 hover:bg-port-100'
              ]"
            >
              {{ item.label }}
            </button>
          </nav>

          <!-- User Actions -->
          <div class="flex items-center space-x-4">
            <!-- Status Indicator -->
            <div class="flex items-center space-x-2">
              <div class="w-2 h-2 bg-success-500 rounded-full animate-pulse"></div>
              <span class="text-sm text-port-600">Sistema Activo</span>
            </div>
            
            <!-- Profile -->
            <div class="w-8 h-8 bg-primary-600 rounded-full flex items-center justify-center">
              <span class="text-white text-sm font-medium">PA</span>
            </div>
          </div>
        </div>
      </div>
    </header>

    <!-- Main Content -->
    <main class="p-6">
      <!-- Dashboard View -->
      <div v-if="currentView === 'dashboard'" class="animate-fade-in">
        <div class="mb-8">
          <h2 class="text-2xl font-bold text-port-900 mb-2">Centro de Control Portuario</h2>
          <p class="text-port-600">Monitoreo en tiempo real del tráfico marítimo y operaciones portuarias</p>
        </div>

        <!-- Key Metrics -->
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
          <div class="metric-card">
            <div class="flex items-center justify-between">
              <div>
                <p class="text-sm font-medium text-port-600">Barcos en Puerto</p>
                <p class="text-3xl font-bold text-port-900">{{ metrics.shipsInPort }}</p>
              </div>
              <div class="w-12 h-12 bg-ocean-100 rounded-xl flex items-center justify-center">
                <svg class="w-6 h-6 text-ocean-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
                    d="M3.055 11H5a2 2 0 012 2v1a2 2 0 002 2 2 2 0 012 2v2.945M8 3.935V5.5A2.5 2.5 0 0010.5 8h.5a2 2 0 012 2 2 2 0 104 0 2 2 0 012-2h1.064M15 20.488V18a2 2 0 012-2h3.064M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
                </svg>
              </div>
            </div>
            <div class="mt-4 flex items-center">
              <span class="text-sm text-success-600 font-medium">+3 desde ayer</span>
            </div>
          </div>

          <div class="metric-card">
            <div class="flex items-center justify-between">
              <div>
                <p class="text-sm font-medium text-port-600">Operaciones Activas</p>
                <p class="text-3xl font-bold text-port-900">{{ metrics.activeOperations }}</p>
              </div>
              <div class="w-12 h-12 bg-warning-100 rounded-xl flex items-center justify-center">
                <svg class="w-6 h-6 text-warning-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
                    d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"/>
                </svg>
              </div>
            </div>
            <div class="mt-4 flex items-center">
              <span class="text-sm text-port-600">Carga/Descarga</span>
            </div>
          </div>

          <div class="metric-card">
            <div class="flex items-center justify-between">
              <div>
                <p class="text-sm font-medium text-port-600">Personal en Turno</p>
                <p class="text-3xl font-bold text-port-900">{{ metrics.staffOnDuty }}</p>
              </div>
              <div class="w-12 h-12 bg-primary-100 rounded-xl flex items-center justify-center">
                <svg class="w-6 h-6 text-primary-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
                    d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"/>
                </svg>
              </div>
            </div>
            <div class="mt-4 flex items-center">
              <span class="text-sm text-success-600 font-medium">Turno de día</span>
            </div>
          </div>

          <div class="metric-card">
            <div class="flex items-center justify-between">
              <div>
                <p class="text-sm font-medium text-port-600">Eficiencia</p>
                <p class="text-3xl font-bold text-port-900">{{ metrics.efficiency }}%</p>
              </div>
              <div class="w-12 h-12 bg-success-100 rounded-xl flex items-center justify-center">
                <svg class="w-6 h-6 text-success-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
                    d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z"/>
                </svg>
              </div>
            </div>
            <div class="mt-4 flex items-center">
              <span class="text-sm text-success-600 font-medium">+5% esta semana</span>
            </div>
          </div>
        </div>

        <!-- Real-time Port Activity -->
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
          <!-- Live Ship Status -->
          <div class="card">
            <div class="card-header">
              <h3 class="text-lg font-semibold text-port-900">Estado de Embarcaciones</h3>
            </div>
            <div class="card-body">
              <div class="space-y-4">
                <div v-for="ship in recentShips" :key="ship.id" 
                  class="flex items-center justify-between p-4 bg-port-50 rounded-lg border border-port-200">
                  <div class="flex items-center space-x-4">
                    <div class="w-10 h-10 bg-ocean-500 rounded-lg flex items-center justify-center">
                      <svg class="w-5 h-5 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
                          d="M3.055 11H5a2 2 0 012 2v1a2 2 0 002 2 2 2 0 012 2v2.945"/>
                      </svg>
                    </div>
                    <div>
                      <h4 class="font-medium text-port-900">{{ ship.name }}</h4>
                      <p class="text-sm text-port-600">{{ ship.type }} - {{ ship.flag }}</p>
                    </div>
                  </div>
                  <div class="text-right">
                    <span :class="[
                      'status-badge',
                      ship.status === 'Atracado' ? 'status-active' :
                      ship.status === 'Cargando' ? 'status-warning' :
                      ship.status === 'Saliendo' ? 'status-inactive' : 'status-danger'
                    ]">
                      {{ ship.status }}
                    </span>
                    <p class="text-xs text-port-500 mt-1">Muelle {{ ship.dock }}</p>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Recent Operations -->
          <div class="card">
            <div class="card-header">
              <h3 class="text-lg font-semibold text-port-900">Operaciones Recientes</h3>
            </div>
            <div class="card-body">
              <div class="space-y-4">
                <div v-for="operation in recentOperations" :key="operation.id" 
                  class="flex items-center justify-between p-4 bg-port-50 rounded-lg border border-port-200">
                  <div class="flex items-center space-x-4">
                    <div :class="[
                      'w-10 h-10 rounded-lg flex items-center justify-center',
                      operation.type === 'Carga' ? 'bg-success-100' :
                      operation.type === 'Descarga' ? 'bg-warning-100' : 'bg-primary-100'
                    ]">
                      <svg class="w-5 h-5" :class="[
                        operation.type === 'Carga' ? 'text-success-600' :
                        operation.type === 'Descarga' ? 'text-warning-600' : 'text-primary-600'
                      ]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
                          d="M5 8l6 6m-6 0l6-6 2-2 4-4"/>
                      </svg>
                    </div>
                    <div>
                      <h4 class="font-medium text-port-900">{{ operation.cargo }}</h4>
                      <p class="text-sm text-port-600">{{ operation.ship }} - {{ operation.type }}</p>
                    </div>
                  </div>
                  <div class="text-right">
                    <p class="text-sm font-medium text-port-900">{{ operation.quantity }}</p>
                    <p class="text-xs text-port-500">{{ operation.time }}</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Ships Inventory View -->
      <div v-else-if="currentView === 'ships'" class="animate-fade-in">
        <div class="mb-8">
          <h2 class="text-2xl font-bold text-port-900 mb-2">Inventario de Embarcaciones</h2>
          <p class="text-port-600">Gestión completa de barcos en el puerto</p>
        </div>

        <div class="card">
          <div class="card-header">
            <div class="flex items-center justify-between">
              <h3 class="text-lg font-semibold text-port-900">Embarcaciones Registradas</h3>
              <button class="btn btn-primary">
                <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"/>
                </svg>
                Nuevo Barco
              </button>
            </div>
          </div>
          <div class="card-body">
            <div class="overflow-x-auto">
              <table class="w-full">
                <thead class="border-b border-port-200">
                  <tr>
                    <th class="text-left py-3 px-4 font-semibold text-port-700">Embarcación</th>
                    <th class="text-left py-3 px-4 font-semibold text-port-700">Tipo</th>
                    <th class="text-left py-3 px-4 font-semibold text-port-700">Bandera</th>
                    <th class="text-left py-3 px-4 font-semibold text-port-700">Muelle</th>
                    <th class="text-left py-3 px-4 font-semibold text-port-700">Estado</th>
                    <th class="text-left py-3 px-4 font-semibold text-port-700">Llegada</th>
                    <th class="text-left py-3 px-4 font-semibold text-port-700">Acciones</th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for="ship in allShips" :key="ship.id" class="border-b border-port-100 hover:bg-port-25">
                    <td class="py-4 px-4">
                      <div class="flex items-center space-x-3">
                        <div class="w-8 h-8 bg-ocean-500 rounded-lg flex items-center justify-center">
                          <svg class="w-4 h-4 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
                              d="M3.055 11H5a2 2 0 012 2v1a2 2 0 002 2 2 2 0 012 2v2.945"/>
                          </svg>
                        </div>
                        <div>
                          <p class="font-medium text-port-900">{{ ship.name }}</p>
                          <p class="text-sm text-port-500">{{ ship.imo }}</p>
                        </div>
                      </div>
                    </td>
                    <td class="py-4 px-4 text-port-700">{{ ship.type }}</td>
                    <td class="py-4 px-4 text-port-700">{{ ship.flag }}</td>
                    <td class="py-4 px-4 text-port-700">{{ ship.dock || '-' }}</td>
                    <td class="py-4 px-4">
                      <span :class="[
                        'status-badge',
                        ship.status === 'Atracado' ? 'status-active' :
                        ship.status === 'Cargando' ? 'status-warning' :
                        ship.status === 'Saliendo' ? 'status-inactive' : 'status-danger'
                      ]">
                        {{ ship.status }}
                      </span>
                    </td>
                    <td class="py-4 px-4 text-port-700">{{ ship.arrival }}</td>
                    <td class="py-4 px-4">
                      <div class="flex space-x-2">
                        <button class="btn btn-secondary btn-sm">Ver</button>
                        <button class="btn btn-secondary btn-sm">Editar</button>
                      </div>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>

      <!-- Placeholder views for other sections -->
      <div v-else class="animate-fade-in">
        <div class="text-center py-16">
          <div class="w-16 h-16 bg-port-100 rounded-full flex items-center justify-center mx-auto mb-4">
            <svg class="w-8 h-8 text-port-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
                d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 9a2 2 0 00-2 2v0a2 2 0 002 2h14a2 2 0 002-2v0a2 2 0 00-2-2"/>
            </svg>
          </div>
          <h3 class="text-lg font-semibold text-port-900 mb-2">Sección en Desarrollo</h3>
          <p class="text-port-600 mb-6">Esta funcionalidad está siendo implementada.</p>
          <p class="text-sm text-port-500">Continúa solicitando desarrollo de más páginas para completar el sistema.</p>
        </div>
      </div>
    </main>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive } from 'vue'

// Navigation state
const currentView = ref('dashboard')

const navigation = [
  { id: 'dashboard', label: 'Dashboard' },
  { id: 'ships', label: 'Embarcaciones' },
  { id: 'cargo', label: 'Carga' },
  { id: 'personnel', label: 'Personal' },
  { id: 'routes', label: 'Rutas' },
  { id: 'tracking', label: 'Seguimiento' }
]

// Dashboard metrics
const metrics = reactive({
  shipsInPort: 24,
  activeOperations: 8,
  staffOnDuty: 156,
  efficiency: 94
})

// Sample data for recent ships
const recentShips = reactive([
  {
    id: 1,
    name: 'MSC Daniela',
    type: 'Contenedores',
    flag: 'Panamá',
    status: 'Cargando',
    dock: 'A-12'
  },
  {
    id: 2,
    name: 'Ever Given',
    type: 'Contenedores',
    flag: 'Panamá',
    status: 'Atracado',
    dock: 'B-05'
  },
  {
    id: 3,
    name: 'Atlantic Star',
    type: 'Granelero',
    flag: 'Liberia',
    status: 'Descargando',
    dock: 'C-08'
  },
  {
    id: 4,
    name: 'Pacific Wind',
    type: 'Tanque',
    flag: 'Marshall Islands',
    status: 'Saliendo',
    dock: '-'
  }
])

// Sample data for recent operations
const recentOperations = reactive([
  {
    id: 1,
    cargo: 'Contenedores refrigerados',
    ship: 'MSC Daniela',
    type: 'Carga',
    quantity: '240 TEU',
    time: 'Hace 15 min'
  },
  {
    id: 2,
    cargo: 'Automóviles',
    ship: 'Car Carrier Hope',
    type: 'Descarga',
    quantity: '180 unidades',
    time: 'Hace 32 min'
  },
  {
    id: 3,
    cargo: 'Cereales',
    ship: 'Atlantic Star',
    type: 'Descarga',
    quantity: '2,400 tons',
    time: 'Hace 1 hora'
  },
  {
    id: 4,
    cargo: 'Combustible',
    ship: 'Pacific Wind',
    type: 'Descarga',
    quantity: '5,000 tons',
    time: 'Hace 2 horas'
  }
])

// All ships data for inventory view
const allShips = reactive([
  {
    id: 1,
    name: 'MSC Daniela',
    imo: 'IMO 9465821',
    type: 'Contenedores',
    flag: 'Panamá',
    status: 'Cargando',
    dock: 'A-12',
    arrival: '12/01/2024 08:30'
  },
  {
    id: 2,
    name: 'Ever Given',
    imo: 'IMO 9811000',
    type: 'Contenedores',
    flag: 'Panamá',
    status: 'Atracado',
    dock: 'B-05',
    arrival: '11/01/2024 14:15'
  },
  {
    id: 3,
    name: 'Atlantic Star',
    imo: 'IMO 9334567',
    type: 'Granelero',
    flag: 'Liberia',
    status: 'Descargando',
    dock: 'C-08',
    arrival: '10/01/2024 22:00'
  },
  {
    id: 4,
    name: 'Pacific Wind',
    imo: 'IMO 9445123',
    type: 'Tanque',
    flag: 'Marshall Islands',
    status: 'Saliendo',
    dock: '-',
    arrival: '09/01/2024 16:45'
  },
  {
    id: 5,
    name: 'Nordic Spirit',
    imo: 'IMO 9556789',
    type: 'Carga General',
    flag: 'Noruega',
    status: 'Atracado',
    dock: 'D-03',
    arrival: '12/01/2024 10:20'
  },
  {
    id: 6,
    name: 'Oriental Express',
    imo: 'IMO 9667890',
    type: 'Contenedores',
    flag: 'Singapur',
    status: 'Esperando',
    dock: '-',
    arrival: '12/01/2024 19:30'
  }
])
</script>

<style scoped>
.btn-sm {
  @apply px-3 py-1.5 text-xs;
}

.animate-fade-in {
  animation: fadeIn 0.5s ease-in-out;
}

@keyframes fadeIn {
  from { opacity: 0; transform: translateY(10px); }
  to { opacity: 1; transform: translateY(0); }
}
</style>
