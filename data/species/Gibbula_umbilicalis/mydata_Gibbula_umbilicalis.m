function [data, auxData, metaData, txtData, weights] = mydata_Gibbula_umbilicalis
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Vetigastropoda'; 
metaData.family     = 'Trochidae';
metaData.species    = 'Gibbula_umbilicalis'; 
metaData.species_en = 'Flat top shell'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MANE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPp', 'jiHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(11); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Ww_L'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine',};    
metaData.date_subm = [2017 02 12];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 02 12]; 

%% set data
% zero-variate data

data.tp = 18*30.5;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Noke2016';
  temp.tp = C2K(11);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 2*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'DonnBrun2016';   
  temp.am = C2K(11);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 0.85; units.Lp  = 'cm';  label.Lp  = 'shell width at puberty for female'; bibkey.Lp  = 'Will1964';
data.Li  = 2.2; units.Li  = 'cm';  label.Li  = 'ultimate shell width';              bibkey.Li  = 'Wiki';

data.Wwb = 3.1e-6;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'Noke2016';
  comment.Wwb = 'based on 0.018 mm egg diameter: 4/3*pi*0.009^3';   
data.Ww1 = 0.23;  units.Ww1 = 'g'; label.Ww1 = 'wet weight at shell width 1 cm'; bibkey.Ww1 = 'RobiGree2010';
  comment.Ww1 = 'based on data for Gibbula cineraria';   

data.Ri  = 1e4/365; units.Ri  = '#/d'; label.Ri = 'reproduction rate at 2 cm';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(11); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% t-L data
data.tL0 = [ ... % time since 1 mrt 1961 (d), shell height (cm)
243.475	0.246
275.258	0.299
305.355	0.371
335.491	0.374
364.820	0.322
395.766	0.375
425.891	0.397
455.245	0.301
487.001	0.401
516.272	0.453
547.988	0.625
577.259	0.678
611.539	0.756
639.922	0.900
670.049	0.919
700.990	0.980
731.936	1.030
762.094	0.995];
units.tL0   = {'d', 'cm'};  label.tL0 = {'time since 1961/02/01', 'shell width'};  
temp.tL0    = C2K(12);  units.temp.tL0 = 'K'; label.temp.tL0 = 'temperature';
bibkey.tL0 = 'Will1964';
comment.tL0 = 'Data for population at Alltwen, Wales';
%
data.tL1 = [ ...  % time since 1 mrt 1961 (d), shell height (cm)
30.807	0.301
62.578	0.374
91.868	0.393
124.455	0.504
154.568	0.549
183.842	0.596
214.785	0.652
243.948	0.898
274.855	1.020
303.204	1.224
335.028	1.203
365.181	1.175
396.119	1.242
426.252	1.251
426.252	1.251
458.891	1.268
487.308	1.351
516.639	1.296
548.420	1.352
577.808	1.194
607.861	1.347
639.645	1.397
668.933	1.419
699.892	1.447
730.043	1.423
760.181	1.423];
units.tL1   = {'d', 'cm'};  label.tL1 = {'time since 1961/02/01', 'shell width'};  
temp.tL1    = C2K(12);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'Will1964';
comment.tL1 = 'Data for population at Alltwen, Wales';
%
data.tL2 = [ ...  % time since 1 mrt 1961 (d), shell height (cm)
30.390	1.047
63.818	1.153
93.860	1.324
123.999	1.322
154.150	1.297
184.258	1.350
214.414	1.317
242.891	1.293
275.510	1.346
304.809	1.349
336.624	1.344
365.070	1.374
396.046	1.372
425.362	1.345];
units.tL2   = {'d', 'cm'};  label.tL2 = {'time since 1961/02/01', 'shell width'};  
temp.tL2    = C2K(12);  units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
bibkey.tL2 = 'Will1964';
comment.tL2 = 'Data for population at Alltwen, Wales';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL0','tL1','tL2'}; subtitle1 = {'Data for year classes at Alltwen, Wales'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '6ZRWJ'; % Cat of Life
metaData.links.id_ITIS = '69984'; % ITIS
metaData.links.id_EoL = '619551'; % Ency of Life
metaData.links.id_Wiki = 'Steromphala_umbilicalis'; % Wikipedia
metaData.links.id_ADW = 'Gibbula_umbilicalis'; % ADW
metaData.links.id_Taxo = '34750'; % Taxonomicon
metaData.links.id_WoRMS = '1039850'; % WoRMS
metaData.links.id_molluscabase = '1039850'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Gibbula_umbilicalis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wiki_nl'; type = 'Misc'; bib = ...
'howpublished = {\url{https://nl.wikipedia.org/wiki/Gibbula_umbilicalis}}';
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
bibkey = 'marlin'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.marlin.ac.uk/species/detail/1481}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Will1964'; type = 'Article'; bib = [ ... 
'author = {Williams, E. E.}, ' ... 
'year = {1964}, ' ...
'title = {The Growth and Distribution of \emph{Gibbula umbilicalis} ({D}a {C}osta) on a Rocky Shore in {W}ales}, ' ...
'journal = {Journal of Animal Ecology}, ' ...
'volume = {33}, ' ...
'pages = {433--442}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Lebo1937'; type = 'Article'; bib = [ ... 
'author = {Lebour, M. V.}, ' ... 
'year = {1935}, ' ...
'title = {The eggs and larvae of the British prosobranchs with special reference to those living in the plankton}, ' ...
'journal = {J. Mar. Biol. Ass. UK}, ' ...
'volume = {22}, ' ...
'pages = {105--116}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Noke2016'; type = 'PhDthesis'; bib = [ ... 
'author = {R. Noke}, ' ... 
'year = {2016}, ' ...
'title = {What is driving the range extension of \emph{Gibbula umbilicalis} ({G}astropoda, {T}rochidae) in the eastern {E}nglish {C}hannel?}, ' ...
'school = {Bournemouth University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DonnBrun2016'; type = 'Article'; bib = [ ... 
'author = {L. Donnarumma and R. Bruno and A. Terlizziand G. F. Russo}, ' ... 
'year = {2016}, ' ...
'title = {Population ecology of \emph{Gibbula umbilicaris} and \emph{Gibbula ardens} ({G}astropoda: {T}rochidae) in a \emph{Posidonia oceanica} seagrass bed}, ' ...
'journal = {Italian Journal of Zoology}, ' ...
'volume = {83}, ' ...
'pages = {103--112}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RobiGree2010'; type = 'Article'; bib = [ ... 
'author = {L. A. Robinson and S. P. R. Greenstreet and H. Reiss and R. Callaway and J. Craeymeersch and I. de Boois and S. Degraer and S. Ehrich and H. M. Fraser and A. Goffin and I. Kroncke and L. L. Jorgenson and M.R. Robertson  and J. Lancaster}, ' ... 
'year = {2010}, ' ...
'title = {Length-weight relationships of 216 {N}orth {S}ea benthic invertebrates and fish}, ' ...
'journal = {J. Mar. Biol. Ass. UK}, ' ...
'volume = {90}, ' ...
'pages = {95-104}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


