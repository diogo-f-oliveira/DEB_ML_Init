function [data, auxData, metaData, txtData, weights] = mydata_Ruditapes_philippinarum

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Veneroida'; 
metaData.family     = 'Veneridae';
metaData.species    = 'Ruditapes_philippinarum'; 
metaData.species_en = 'Manila_clam';

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MANE', 'MPNW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'Da'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wdb'; 'Wdj'; 'Wdp'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L';'L-Wd'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Jonathan Flye-Sainte-Marie'};    
metaData.date_subm = [2011 09 21];              
metaData.email    = {'jonathan.flye@univ-brest.fr'};            
metaData.address  = {'University of Brest, France'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2011 09 23];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Mathilde Mahe' };   
metaData.date_mod_2     = [2019 04 06];             
metaData.email_mod_2    = {'mahe.gipreb@gmail.com'};           
metaData.address_mod_2  = {'GIPREB Syndicat Mixte & Mediterranean Institute of Oceanography, France'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 06 15]; 

%% set data
% zero-variate data

data.ab = 2;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = {'HelmPeli1990', 'JoneSanf1993'};   
  temp.ab = C2K(21.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.aj = 11;    units.aj = 'd';    label.aj = 'age at metamorphosis';     bibkey.aj = 'Calvez2002';   
   temp.aj = C2K(25.5);  units.temp.aj = 'K'; label.temp.aj = 'temperature'; %Ideal temp between 23-28 degree (from Genez et al, 2015)
data.tp = 363;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'HollandChew1974';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 6000; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'Flye2008';
  comment.am = 'guess';  
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature';
  

data.Lb  = 0.0095;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = {'HelmPeli1990', 'JoneSanf1993'};
data.Lj  = 0.025;   units.Lj  = 'cm';  label.Lj  = 'total length at metamorphosis';  bibkey.Lj  = 'LeTreut1986'; 
data.Lp  = 1.5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'HollandChew1974';
data.Li  = 5.212;   units.Li  = 'cm';  label.Li  = 'ultimate total length';      bibkey.Li  = 'Mahe2018';
	comment.Li = 'Berre Lagoon, France (2018)';

data.Wdb = 2.3e-9;   units.Wdb = 'g';   label.Wdb = 'dry weight at birth';   bibkey.Wdb = 'Flye2008';
  comment.Wdb = 'guess, taken from Mytilus edulis';
data.Wdj = 1e-5;   units.Wdj = 'g';   label.Wdj = 'dry weight at metamorphosis';    bibkey.Wdj = 'guess';
data.Wdp = 0.043;    units.Wdp = 'g';   label.Wdp = 'dry weight at puberty'; bibkey.Wdp = 'guess';
data.Wdi = 0.98;   units.Wdi = 'g';   label.Wdi = 'ultimate dry weight';        bibkey.Wdi = 'Mahe2018';
  comment.Wdi = 'In Berre lagoon, personal observations 2018'; 

data.Ri  = 7500; units.Ri  = '#/d';     label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Laru1999';   
  temp.Ri = C2K(14.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Data from Gulf of Morbihan, computed from Laru1999';
  
% uni-variate data
% t-L data
data.tL = [ ... %  time since start (d), shell length (mm)
0.80	5.1385829729432;
9.2	    5.2248315009254;
17.6	7.37004058669003;
33.68	11.1735910194851;
44.72	13.1972039306138;
58.4	12.0093104629884;
66.8	13.7961858493362;
74.72	19.4606179420556;
92.0	19.2458612015081;
119.6	21.5045381883427;
141.2	23.8953421270342;
155.6	23.2415485050325;
184.4	25.9691557654758;
216.8	29.5039061607991;
221.6	29.9991143708236;
242.0	32.0644722601789;
243.2	31.7106262738656;
273.2	34.2720244542858;
284.0	34.8472631291726;
297.2	34.0823961817244;
309.2	36.8353720078807;
316.4	37.453635180838;
368.0	40.0322166665972];
data.tL(:,2) = data.tL(:,2)/ 10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since start', 'shell length'};  
temp.tL    = C2K(22);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'RoddSund1976'; 

% L-Wd data
data.LWd = [ ... % shell length (mm), dry weight (g) 
20.07	20.49	20.65	20.69	20.95	20.96	21.06	21.10	21.20	21.23	21.25	21.26	21.34	21.36	21.45	21.52	21.53	21.80	21.84	22.18	22.18	22.21	22.67	22.82	22.84	22.85	22.88	22.89	23.11	23.12	23.12	23.15	23.18	23.27	23.45	23.52	23.58	23.64	23.69	23.77	23.90	24.21	24.23	24.24	24.31	24.56	24.57	24.57	24.64	24.64	24.67	24.67	24.84	24.85	24.88	24.93	24.96	25.04	25.13	25.14	25.22	25.26	25.28	25.36	25.62	25.68	25.75	25.77	25.81	25.88	25.89	25.90	25.93	25.96	25.99	26.02	26.06	26.11	26.16	26.18	26.25	26.30	26.36	26.36	26.39	26.41	26.43	26.43	26.44	26.45	26.45	26.51	26.53	26.57	26.60	26.63	26.67	26.68	26.68	26.74	26.75	26.79	26.88	26.91	26.95	27.00	27.03	27.03	27.05	27.10	27.13	27.17	27.23	27.24	27.24	27.31	27.31	27.32	27.34	27.35	27.36	27.41	27.44	27.44	27.47	27.53	27.54	27.57	27.57	27.57	27.61	27.62	27.68	27.69	27.71	27.74	27.76	27.77	27.81	27.86	27.90	27.90	27.93	27.94	28.11	28.12	28.14	28.15	28.17	28.24	28.24	28.26	28.27	28.30	28.32	28.33	28.34	28.34	28.37	28.42	28.43	28.47	28.50	28.53	28.54	28.60	28.60	28.61	28.62	28.64	28.65	28.67	28.69	28.69	28.70	28.71	28.75	28.78	28.79	28.79	28.82	28.85	28.85	28.89	28.94	28.97	28.97	28.99	29.00	29.05	29.05	29.11	29.11	29.14	29.17	29.24	29.25	29.27	29.30	29.31	29.37	29.38	29.38	29.38	29.40	29.41	29.41	29.42	29.44	29.47	29.51	29.52	29.57	29.59	29.60	29.62	29.63	29.63	29.63	29.69	29.70	29.75	29.77	29.78	29.80	29.82	29.84	29.84	29.88	29.92	29.95	29.98	30.08	30.08	30.16	30.19	30.19	30.21	30.25	30.26	30.27	30.30	30.33	30.37	30.38	30.40	30.41	30.45	30.46	30.50	30.59	30.59	30.70	30.71	30.71	30.73	30.73	30.76	30.80	30.81	30.82	30.84	30.84	30.94	30.95	30.97	31.01	31.02	31.08	31.10	31.14	31.17	31.17	31.20	31.21	31.25	31.26	31.29	31.32	31.34	31.36	31.36	31.42	31.58	31.58	31.73	31.73	31.74	31.76	31.87	31.90	31.97	31.99	32.00	32.03	32.05	32.12	32.15	32.19	32.23	32.24	32.26	32.31	32.40	32.42	32.45	32.46	32.47	32.49	32.49	32.51	32.52	32.55	32.55	32.62	32.63	32.63	32.64	32.68	32.69	32.69	32.70	32.75	32.76	32.83	32.85	32.88	32.98	32.99	33.01	33.02	33.03	33.09	33.09	33.22	33.25	33.26	33.29	33.30	33.32	33.33	33.34	33.44	33.45	33.46	33.49	33.49	33.50	33.56	33.57	33.57	33.60	33.60	33.67	33.69	33.76	33.77	33.77	33.80	33.82	33.83	33.86	33.94	34.00	34.09	34.16	34.21	34.22	34.26	34.31	34.32	34.32	34.35	34.36	34.39	34.41	34.47	34.55	34.65	34.74	34.75	34.77	34.82	34.86	34.87	34.89	34.95	34.96	35.12	35.13	35.15	35.20	35.29	35.31	35.41	35.42	35.48	35.62	35.67	35.81	35.97	35.99	36.03	36.08	36.15	36.19	36.39	36.51	36.57	36.59	36.63	36.68	36.69	36.71	36.74	36.87	36.97	37.07	37.13	37.15	37.23	37.34	37.37	37.38	37.43	37.52	37.54	37.70	37.83	37.85	37.86	37.89	38.02	38.15	38.30	38.34	38.39	38.47	38.53	38.70	38.71	38.72	38.76	38.81	39.09	39.12	39.15	39.18	39.18	39.34	39.40	39.57	40.05	40.08	40.32	40.40	40.52	40.55	40.60	40.63	40.90	40.94	41.01	41.07	41.22	41.31	41.42	41.46	41.48	41.52	41.89	42.29	42.48	42.48	42.55	42.58	42.62	42.81	43.11	43.17	43.22	43.77	43.85	44.03	44.13	44.32	44.34	44.49	44.65	44.71	44.71	44.93	45.05	45.34	45.38	45.60	45.70	45.82	45.95	46.21	46.30	46.61	46.84	46.99	47.04	47.10	47.55	48.20	48.27	48.51	48.87	50.38	50.96;
0.04	0.08	0.08	0.07	0.06	0.07	0.05	0.07	0.08	0.05	0.06	0.06	0.08	0.08	0.06	0.07	0.09	0.08	0.11	0.12	0.11	0.08	0.09	0.08	0.07	0.10	0.07	0.12	0.10	0.12	0.16	0.14	0.14	0.14	0.10	0.10	0.14	0.14	0.09	0.08	0.09	0.10	0.09	0.11	0.08	0.16	0.12	0.10	0.14	0.12	0.16	0.15	0.17	0.13	0.20	0.17	0.14	0.13	0.20	0.11	0.16	0.17	0.11	0.16	0.18	0.21	0.16	0.11	0.12	0.23	0.17	0.09	0.13	0.18	0.17	0.16	0.16	0.22	0.12	0.25	0.13	0.18	0.14	0.12	0.23	0.19	0.16	0.18	0.21	0.14	0.22	0.18	0.18	0.16	0.19	0.17	0.17	0.23	0.23	0.20	0.17	0.18	0.13	0.15	0.22	0.28	0.20	0.11	0.22	0.20	0.23	0.18	0.13	0.24	0.19	0.15	0.25	0.22	0.24	0.18	0.15	0.22	0.14	0.13	0.22	0.20	0.23	0.26	0.19	0.12	0.28	0.18	0.22	0.13	0.21	0.21	0.13	0.26	0.24	0.24	0.13	0.21	0.20	0.27	0.17	0.12	0.12	0.09	0.21	0.15	0.23	0.32	0.08	0.20	0.27	0.15	0.19	0.14	0.25	0.15	0.31	0.23	0.15	0.17	0.22	0.24	0.12	0.22	0.22	0.24	0.18	0.25	0.21	0.14	0.20	0.15	0.15	0.24	0.30	0.15	0.30	0.17	0.13	0.18	0.16	0.16	0.24	0.17	0.17	0.16	0.14	0.26	0.19	0.26	0.30	0.16	0.22	0.19	0.27	0.30	0.30	0.18	0.22	0.24	0.25	0.15	0.25	0.19	0.16	0.30	0.35	0.25	0.15	0.16	0.27	0.23	0.18	0.31	0.26	0.26	0.31	0.16	0.16	0.17	0.25	0.16	0.30	0.23	0.07	0.32	0.24	0.29	0.14	0.27	0.28	0.30	0.33	0.26	0.24	0.26	0.31	0.10	0.22	0.24	0.12	0.13	0.18	0.15	0.25	0.34	0.38	0.20	0.27	0.42	0.12	0.15	0.17	0.19	0.28	0.11	0.16	0.20	0.29	0.17	0.17	0.32	0.15	0.31	0.13	0.16	0.25	0.20	0.40	0.25	0.13	0.33	0.18	0.28	0.23	0.19	0.19	0.23	0.16	0.22	0.25	0.23	0.27	0.42	0.30	0.28	0.24	0.22	0.25	0.16	0.31	0.35	0.25	0.30	0.22	0.20	0.20	0.38	0.38	0.28	0.22	0.40	0.29	0.26	0.36	0.32	0.22	0.25	0.24	0.37	0.32	0.40	0.33	0.25	0.35	0.32	0.31	0.17	0.26	0.29	0.26	0.29	0.32	0.27	0.23	0.27	0.39	0.22	0.36	0.33	0.47	0.21	0.34	0.20	0.23	0.44	0.30	0.27	0.39	0.42	0.22	0.22	0.24	0.14	0.35	0.32	0.36	0.27	0.31	0.35	0.28	0.32	0.30	0.40	0.23	0.34	0.41	0.22	0.17	0.19	0.40	0.26	0.38	0.50	0.39	0.39	0.27	0.31	0.27	0.22	0.35	0.26	0.16	0.48	0.34	0.41	0.27	0.34	0.15	0.20	0.35	0.31	0.22	0.30	0.36	0.43	0.39	0.20	0.26	0.32	0.41	0.42	0.46	0.42	0.44	0.43	0.31	0.33	0.52	0.35	0.41	0.44	0.47	0.57	0.43	0.37	0.26	0.39	0.45	0.37	0.40	0.50	0.37	0.40	0.46	0.54	0.49	0.53	0.50	0.53	0.43	0.63	0.60	0.37	0.40	0.39	0.66	0.73	0.58	0.20	0.50	0.58	0.18	0.36	0.65	0.50	0.48	0.75	0.50	0.54	0.52	0.40	0.68	0.30	0.51	0.85	0.51	0.54	0.58	0.77	0.61	0.43	0.87	0.48	0.48	0.63	0.68	0.44	0.46	0.68	0.79	0.43	0.67	0.66	0.59	0.81	0.38	0.84	1.03	0.74	0.70	0.86	0.90	0.84	0.71	0.72	0.82	0.71	0.61	0.67	0.66	0.93	0.75	0.85	0.93	0.52	0.70	0.74	0.86	0.99	0.83	0.95	0.71	0.83	0.75	0.97	0.97	0.97	0.83	0.62	0.62	0.78	0.71	0.96	0.79	0.85	0.91	0.76	0.65
]';   
data.LWd(:,1) = data.LWd(:,1)/10; % convert mm to cm
units.LWd = {'cm', 'g'};     label.LWd = {'shell length', 'dry weight'};
temp.LWd = C2K(18);  units.temp.LWd = 'K'; label.temp.LWd = 'temperature';
bibkey.LWd = 'Mahe2018';
comment.LWd = 'In Berre lagoon, personal observations may 2018';

%% set weights for all real data
weights = setweights(data, []);
% weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'This entry is discussed in Flye2008';
metaData.bibkey.F1 = {'Flye2008'}; 
metaData.facts = struct('F1',F1);

%% Discussion
D1 = 'Mod_2:  changed : tp, Lp, Li, Wdp and Wdi and added aj, Lj, Wdj, L-Wd';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '4TMNJ'; % Cat of Life
metaData.links.id_ITIS = '81477'; % ITIS
metaData.links.id_EoL = '46469874'; % Ency of Life
metaData.links.id_Wiki = 'Ruditapes_philippinarum'; % Wikipedia
metaData.links.id_ADW = 'Venerupis_philippinarum'; % ADW
metaData.links.id_Taxo = '39617'; % Taxonomicon
metaData.links.id_WoRMS = '231750'; % WoRMS
metaData.links.id_molluscabase = '231750'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ruditapes_philippinarum}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mahe2018'; type = 'Misc'; bib = [...
'howpublished = {Pers. Observation,  Berre Lagoon, France}, ' ...
'author = {Mah\''{e}, M.}, ' ...
'year = {2018}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Flye2008'; type = 'Phdthesis'; bib = [ ... 
'author = {Flye Sainte Marie, J.}, ' ... 
'year = {2008}, ' ...
'title = {Ecophysiology of brown ring deseaqse in the {M}anilla clam \emph{Ruditapes philippinarum}, experimental and modelling approaches}, ' ...
'school = {VU University Amsterdam and Brest University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HelmPeli1990'; type = 'Techreport'; bib = [ ... 
'author = {Helm, M. M. and Pelizzato, M.}, ' ... 
'year = {1990}, ' ...
'title = {\emph{Tapes philippinarum}: biologia e sperimentazione. }, ' ...
'instiutution = {Ente di Svilupo Agricolo Veneto}, ' ...
'volume = {Hatchery, Breeding and Rearing of the Tapes philippinarum species}, ' ...
'pages = {117--140}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JoneSanf1993'; type = 'Book'; bib = [ ... 
'author = {Jones, G. G. and Sanford, C. L.}, ' ... 
'year = {1993}, ' ...
'title = {Manila Clams: Hatchery and Nursery Methods.}, ' ...
'publisher = {Innovative Aquaculture Products, Ltd}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Laru1999'; type = 'Article'; bib = [ ... 
'author = {Laruelle, F.}, ' ... 
'year = {1999}, ' ...
'title = {Phenologie et determinisme de la reproduction chez \emph{Ruditapes decussatus} ({L}.) and \emph{Ruditapes philippinarum}, on intertidal flats in {B}rittany}, ' ...
'journal = {J. Mar. Biol. Assoc.}, ' ...
'volume = {172}, ' ...
'pages = {69--96}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RoddSund1976'; type = 'Article'; bib = [ ... 
'author = {Rodde, K. M.  and Sunderlin, J. B. and Roels, O. A.}, ' ... 
'year = {1976}, ' ...
'title = {Experimental cultivation of \emph{Tapes japonica} ({D}eshayes) ({B}ivalvia: {V}eneridae) in an artificial upwelling culture system}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {9}, ' ...
'pages = {203--215}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Calvez2002'; type = 'Phdthesis'; bib = [ ... 
'author = {Calvez, I.}, ' ... 
'year = {2002}, ' ...
'title = {Approche de la variabilit\''{e} spatiale d une population de palourdes \emph{Ruditapes philippinarum} ({A}dams et {R}eeve), aux stades larvaires et post-larvaires}, ' ...
'school = {Brest University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HollandChew1974'; type = 'Article'; bib = [ ... 
'author = {Holland, D. A.  and Chew, K. K.}, ' ... 
'year = {1974}, ' ...
'title = {Reproductive cycle of the {M}anila clam (\emph{Venerupis japonica}) from {H}ood {C}anal, {W}ashington}, ' ...
'journal = {Proceedings of the National Shellfisheries Association}, ' ...
'volume = {64}, ' ...
'pages = {53--58}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LeTreut1986'; type = 'Phdthesis'; bib = [ ... 
'author = {Le Treut, Y.}, ' ... 
'year = {1986}, ' ...
'title = {La palourde. {A}natomie - Biologie - Elevage - P\^{e}che - Consommation - Inspection sanitaire}, ' ...
'school = {Nantes University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];