function [data, auxData, metaData, txtData, weights] = mydata_Podocnemis_unifilis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Podocnemididae';
metaData.species    = 'Podocnemis_unifilis'; 
metaData.species_en = 'Yellow-spotted river turtle'; 

metaData.ecoCode.climate = {'Af', 'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0bTd', 'biFr', 'biFm'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biHl', 'biHs'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'; 't-Ww_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 10 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 10 06];

%% set data
% zero-variate data

data.ab = 60;     units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'AnAge';
  temp.ab = C2K(30.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 4.5*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'fao';
  temp.tp = C2K(27);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'guess based on longest period from which [p_M] > 3';
data.am = 70*365;     units.am = 'd';    label.am = 'life span';         bibkey.am = 'AnAge';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'value is unverified; Wiki gives more than 30 yr';
  
data.Lb = 4.8; units.Lb = 'cm';  label.Lb = 'carapace length at birth';     bibkey.Lb = 'MeerRobi2016';
data.Lp = 31; units.Lp = 'cm';   label.Lp = 'carapace length at puberty for females';  bibkey.Lp = 'MiorGiar2016';
data.Lpm = 19; units.Lpm = 'cm'; label.Lpm = 'carapace length at puberty for males';  bibkey.Lpm = 'MiorGiar2016';
data.Li = 52; units.Li = 'cm';   label.Li = 'ultimate carapace length for females';  bibkey.Li = 'arkive';
data.Lim = 39; units.Lim = 'cm'; label.Lim = 'ultimate carapace length for males';  bibkey.Lim = 'arkive';

data.Wwb = 21.9; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'MeerRobi2016';
  comment.Wwb = 'based on (Lb/Li)^3*Wwi';
data.Wwp = 2458; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'MiorGiar2016';
  comment.Wwp = 'based on (Lp/Li)^3*Wwi';
data.Wwpm = 520; units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty';   bibkey.Wwpm = 'MiorGiar2016';
  comment.Wwpm = 'based on (Lp/Li)^3*Wwi';
data.Wwi = 11600; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'arkive';
data.Wwim = 4500; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'arkive';

data.Ri = 40/365;     units.Ri = '#/d';    label.Ri = 'max reproduction rate';  bibkey.Ri = 'Wiki';   
  temp.Ri = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = '4 till 35 eggs per clutch, 2 clutches per yr';
  
% uni-variate data

% time-length
data.tL1 = [ ... % time since birth (d), straight carapace length (cm)
0.000	4.931
182.750	7.076
213.707	7.957
243.666	8.400
274.624	8.805
304.583	9.367
335.540	9.771
395.458	10.659
547.250	12.718
608.167	15.195
730.999	16.056];
units.tL1   = {'d', 'cm'};  label.tL1 = {'time', 'straight carapace length', 'Commercial Gel diet'};  
temp.tL1    = C2K(27);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'MeerRobi2016';
comment.tL1 = 'Data for Commercial Gel diet';
%
data.tL2 = [ ... % time since birth (d), straight carapace length (cm)
0.999	4.851
181.751	6.877
213.707	7.281
243.666	7.725
273.625	7.930
304.583	8.374
334.542	8.539
396.457	9.228
547.250	10.811
609.166	13.288
729.001	13.870];
units.tL2   = {'d', 'cm'};  label.tL2 = {'time', 'straight carapace length', 'Vegetarian diet'};  
temp.tL2    = C2K(27);  units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
bibkey.tL2 = 'MeerRobi2016';
comment.tL2 = 'Data for Vegetarian diet';
%
data.tL3 = [ ... % time since birth (d), straight carapace length (cm)
0.000	4.891
181.751	6.281
213.707	6.288
244.665	6.652
273.625	6.818
303.584	6.943
334.542	7.188
396.457	7.838
547.250	8.546
607.168	9.394
729.001	11.566];
units.tL3   = {'d', 'cm'};  label.tL3 = {'time', 'straight carapace length', 'Omnivorous diet'};  
temp.tL3    = C2K(27);  units.temp.tL3 = 'K'; label.temp.tL3 = 'temperature';
bibkey.tL3 = 'MeerRobi2016';
comment.tL3 = 'Data for Omnivorous diet';

% time-weight
data.tW1 = [ ... % time since birth (d), wet weight (g)
182.000	64.563
212.748	83.819
243.495	97.411
272.755	116.667
303.502	131.392
333.754	147.249
394.257	185.761
455.752	311.489
546.507	434.951
606.514	501.780
727.520	653.560];
units.tW1   = {'d', 'g'};  label.tW1 = {'time', 'straight carapace length', 'Commercial Gel diet'};  
temp.tW1    = C2K(27);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'MeerRobi2016';
comment.tW1 = 'Data for Commercial Gel diet';
%
data.tW2 = [ ... % time since birth (d), wet weight (g)
182.000	57.767
212.748	66.828
242.999	78.155
272.755	84.951
303.006	96.278
333.754	111.003
394.753	124.595
455.752	192.557
546.507	289.968
607.010	334.142
728.016	419.094];
units.tW2   = {'d', 'g'};  label.tW2 = {'time', 'straight carapace length', 'Vegetarian diet'};  
temp.tW2    = C2K(27);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2 = 'MeerRobi2016';
comment.tW2 = 'Data for Vegetarian diet';
%
data.tW3 = [ ... % time since birth (d), wet weight (g)
182.496	45.307
212.252	45.307
242.999	49.838
273.251	57.767
303.998	58.900
333.754	67.961
394.257	78.155
455.256	103.074
546.011	123.463
607.010	148.382
728.016	205.016];
units.tW3   = {'d', 'g'};  label.tW3 = {'time', 'straight carapace length', 'Omnivorous diet'};  
temp.tW3    = C2K(27);  units.temp.tW3 = 'K'; label.temp.tW3 = 'temperature';
bibkey.tW3 = 'MeerRobi2016';
comment.tW3 = 'Data for Omnivorous diet';

%% set weights for all real data
weights = setweights(data, []);
weights.Ri =  5 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL1','tL2','tL3'}; subtitle1 = {'Data for Commercial, Vegetarian, Omnivorous diet'};
set2 = {'tW1','tW2','tW3'}; subtitle2 = {'Data for Commercial, Vegetarian, Omnivorous diet'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'If eggs are incubated below 32 C, males hatch, above 32 C females'; 
metaData.bibkey.F1 = 'arkive';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4KQGF'; % Cat of Life
metaData.links.id_ITIS = '202121'; % ITIS
metaData.links.id_EoL = '790997'; % Ency of Life
metaData.links.id_Wiki = 'Podocnemis_unifilis'; % Wikipedia
metaData.links.id_ADW = 'Podocnemis_unifilis'; % ADW
metaData.links.id_Taxo = '48187'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Podocnemis&species=unifilis'; % ReptileDB
metaData.links.id_AnAge = 'Podocnemis_unifilis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Podocnemis_unifilis}}';
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
bibkey = 'MeerRobi2016'; type = 'Article'; bib = [ ... 
'author = {Meers, M. B. and K. L. Robinson and D. Smith and A. Scordino and L. Fisher}, ' ... 
'year = {2016}, ' ...
'title = {Effect of diet on growth in captive \emph{Podocnemis unifilis}: assessing optimal diets for turtles in head-starting programs}, ' ...
'journal = {Bullitin Florida Museum Natural History}, ' ...
'volume = {54}, ' ...
'number = {4}, ' ...
'pages = {58-68}, ' ...
'howpublished = {\url{https://www.flmnh.ufl.edu/bulletin/publications/}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MiorGiar2016'; type = 'Article'; bib = [ ... 
'author = {P. S. Miorando and T. Giarrizzo and J. C. B. Pezzuti}, ' ... 
'year = {2015}, ' ...
'title = {Population structure and allometry of \emph{Podocnemis unifilis} ({T}estudines, {P}odocnemididae) in a protected area upstream {B}elo {M}onte dam in {X}ingu {R}iver, {B}razil}, ' ...
'journal = {Anais da Academia Brasileira de Ci\^{e}ncias}, ' ...
'volume = {87}, ' ...
'number = {4}, ' ...
'pages = {2067--2079}, ' ...
'howpublished = {\url{https://www.flmnh.ufl.edu/bulletin/publications/}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Podocnemis_unifilis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'arkive'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.arkive.org/yellow-headed-sideneck-turtle/podocnemis-unifilis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fao'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fao.org/docrep/t0750e/t0750e09.htm/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


