function [data, auxData, metaData, txtData, weights] = mydata_Octopus_mimus

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Octopoda'; 
metaData.family     = 'Octopodidae';
metaData.species    = 'Octopus_mimus'; 
metaData.species_en = 'Gould octopus'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMc', 'jiMb'};
metaData.ecoCode.embryo  = {'Mc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Wdb'; 'Wwp'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-Ww', 'T-t'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 02 26];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 02 26]; 

%% set data
% zero-variate data

data.am = 240;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'ADW';   
  temp.am = C2K(20);     units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Data for O. vulgaris: 0.5 till 1 yr';  
data.Wdb = 5.5e-4; units.Wdb = 'g';   label.Wdb = 'dry weight at birth';     bibkey.Wdb = 'UriaEspi2012';
data.Wwp = 890;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'ZuniOlvi2014';
  comment.Wwp = '200 g for males';
data.Wwi = 3700;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'Wiki';
  comment.Wwi = '4400 g for males';

data.Ni  = 4e5; units.Ni  = '#';   label.Ni  = 'cum reprod at death';     bibkey.Ni  = 'ZuniOlvi2014';   
  temp.Ni = C2K(20);    units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
 
% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), wet weight (g)
0.120	51.953
0.121	49.219
0.251	41.016
9.810	71.094
10.065	87.500
10.066	80.664
19.877	143.555
19.881	124.414
20.008	132.617
30.067	254.297
30.071	232.422
30.075	207.812
39.875	329.492
39.984	440.234
40.122	391.016
50.045	544.141
50.187	475.781
50.198	418.359
59.740	534.570
59.988	591.992
60.140	467.578
70.199	587.891
70.211	525.000];
units.tW   = {'d', 'g'};  label.tW = {'time', 'wet weight'};  
temp.tW    = C2K(20);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'CortGonz1999';

data.Ta = [ ... % Temperature (C), time since Naef stage 4 at Naef stage 15 (d)
19.7 39
18   55
17   61];
units.Ta   = {'C', 'd'};  label.Ta = {'temperature', 'time'};  
bibkey.Ta = 'ZuniOlvi2014';
%
data.Tt = [ ...
21 38
18 42
15 56
12 76];
units.Tt   = {'C', 'd'};  label.Tt = {'temperature', 'time'};  
bibkey.Tt = 'UriaEspi2012';
comment.Tt = 'time since Neaf stage 4 at Neaf stage 15: Chromatophores first appeared';

%% set weights for all real data
weights = setweights(data, []);
% weights.Wdb = 3 * weights.Wdb;
% weights.Ni = 3 * weights.Ni;
% weights.tW = 3 * weights.tW;
weights.am = 3 * weights.am;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'Ta','Tt'}; subtitle1 = {'Age at birth, time between Naef stages 4 and 15'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'z is not well-fixed by data, size ultimate size is much larger than size at death';
D2 = 'in view of fitting results, puberty does not coincide with mating and part of structure converts to eggs just before death';
D3 = 'model abj has been used, meaning that settlement has no effect on acceleration';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Facts
F1 = 'semelparous: death at first spawning, female ventilates eggs and dies after hatching; No food intake during this period';
metaData.bibkey.F1 = 'ZuniOlvi2014'; 
F2 = 'small eggs with a planktontic larval stage';
metaData.bibkey.F2 = 'ZuniOlvi2014'; 
F3 = 'males and females grow at the same rate; males mature before females';
metaData.bibkey.F3 = 'CortGonz1999'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '48KNH'; % Cat of Life
metaData.links.id_ITIS = '556145'; % ITIS
metaData.links.id_EoL = '593211'; % Ency of Life
metaData.links.id_Wiki = 'Octopus_mimus'; % Wikipedia
metaData.links.id_ADW = 'Octopus_mimus'; % ADW
metaData.links.id_Taxo = '158255'; % Taxonomicon
metaData.links.id_WoRMS = '342001'; % WoRMS
metaData.links.id_molluscabase = '342001'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Octopus_mimus}}';
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
bibkey = 'CortGonz1999'; type = 'Article'; bib = [ ... 
'author = {T. Cortez and A. F. Gonzalez and A. Guerra}, ' ... 
'year = {1999}, ' ...
'title = {Growth of cultured \emph{Octopus mimus} ({C}ephalopoda, {O}ctopodidae)}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {40}, ' ...
'pages = {81--89}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'UriaEspi2012'; type = 'Article'; bib = [ ... 
'author = {I. Uriarte and V. Espinoza and M. Herrera and O. Zuniga and A. Olivares and P. Carbonell and S. Pino and A. Farias and C. Rosas}, ' ... 
'year = {2012}, ' ...
'title = {Effect of temperature on embryonic development of \emph{Octopus mimus} under controlled conditions}, ' ...
'journal = {Journal of Experimental Marine Biology and Ecology}, ' ...
'volume = {416-417}, ' ...
'pages = {168-175}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ZuniOlvi2014'; type = 'Incollection'; bib = [ ... 
'author = {O. Zuniga and A. Olivares and C. Rosas}, ' ... 
'year = {2014}, ' ...
'title = {Octopus mimus}, ' ...
'booktitle = {Cephalopod culture}, ' ...
'editor = {J. Iglesias and L. Fuentes and R. Villaneuva}, ' ...
'pages = {397-413}, ' ...
'publisher = {Springer}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Octopus_vulgaris/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

