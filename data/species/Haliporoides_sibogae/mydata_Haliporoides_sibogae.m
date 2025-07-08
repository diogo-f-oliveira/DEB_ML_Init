function [data, auxData, metaData, txtData, weights] = mydata_Haliporoides_sibogae

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Solenoceridae';
metaData.species    = 'Haliporoides_sibogae'; 
metaData.species_en = 'Jack-knife shrimp'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0bMb', 'bjMpe', 'jiMb'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjP', 'jiD', 'jiS'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6); % K, body temp
metaData.data_0     = {'ap'; 'am';'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 12 19];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 12 19]; 

%% set data
% zero-variate data

data.tp = 2*365;  units.tp = 'd';      label.tp = 'time since birth at puberty'; bibkey.tp = 'OhtoMats1998';
  temp.tp = C2K(6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 4*365;  units.am = 'd';     label.am = 'life span';                bibkey.am = 'OhtoMats1998';   
  temp.am = C2K(6);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 10;   units.Lp  = 'cm'; label.Lp  = 'body length at puberty'; bibkey.Lp  = 'OhtoMats1998';
data.Li  = 17.1;   units.Li  = 'cm'; label.Li  = 'ultimate body length for females';   bibkey.Li  = 'OhtoMats1998';
data.Lim  = 13.0;   units.Lim  = 'cm'; label.Lim  = 'ultimate body length for males';   bibkey.Lim  = 'OhtoMats1998';

data.Wwb = 2.74e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on value for Palaemonetes varians';
data.Wwi = 29.22;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'OhtoMats1998';
data.Wwim = 17.35; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight';     bibkey.Wwim = 'OhtoMats1998';

data.GSI  = 0.14; units.GSI  = '-'; label.GSI  = 'gonado-somatic index'; bibkey.GSI = 'OhtoMats1998';   
temp.GSI = C2K(6); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% uni-variate data
% time-length data
data.tL_f = [ ... % time (d), body length (cm)
51.128	5.218
78.911	6.244
114.930	5.647
180.656	6.960
203.172	7.546
260.197	8.455
277.337	8.120
312.192	9.956
326.092	10.506
358.862	10.757
412.309	11.078
443.332	11.219
479.452	11.065
546.510	10.683
567.237	10.973
620.819	11.884
643.192	11.842
677.649	11.946
698.419	12.421
722.530	12.453];
data.tL_f(:,1) = data.tL_f(:,1) - data.tL_f(1,1); % set first data point at origin
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time', 'body length', 'female'};  
temp.tL_f    = C2K(6);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'OhtoMats1998';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), carapace length (cm)
50.736	5.107
80.102	5.949
119.772	6.568
183.515	6.923
204.230	7.398
259.459	8.567
280.085	8.268
314.679	9.661
335.334	9.620
361.142	9.467
414.577	10.009
447.322	10.298
485.203	10.327
550.588	9.982
571.282	10.273
622.986	10.741
641.925	10.737
678.109	10.988
698.782	11.095
728.003	10.683];
data.tL_m(:,1) = data.tL_m(:,1) - data.tL_m(1,1); % set first data point at origin
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time', 'body length', 'male'};  
temp.tL_m    = C2K(6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'OhtoMats1998';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Deep water species';
metaData.bibkey.F1 = 'OhtoMats1998'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = ''; % Cat of Life not present 2021/08/07
metaData.links.id_ITIS = '96020'; % ITIS
metaData.links.id_EoL = '1040006'; % Ency of Life
metaData.links.id_Wiki = 'Penaeoidea'; % Wikipedia
metaData.links.id_ADW = 'Haliporoides_sibogae'; % ADW
metaData.links.id_Taxo = '403034'; % Taxonomicon
metaData.links.id_WoRMS = '220285'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Penaeoidea}}';
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
bibkey = 'OhtoMats1998'; type = 'Article'; bib = [ ...
'author = {Jun Ohtomi and Tatsuro Matsuoka}, ' ...
'year = {1998}, ' ...
'title = {Reproduction and growth of Jack-knife shrimp, \emph{Haliporoides sibogae}, off south-western {K}yushu, {J}apan}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {38}, ' ...
'pages = {271-281}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
