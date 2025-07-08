function [data, auxData, metaData, txtData, weights] = mydata_Sigmodon_ochrognathus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Sigmodon_ochrognathus'; 
metaData.species_en = 'Yellow-nosed cotton rat'; 

metaData.ecoCode.climate = {'BSk'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTg', '0iTh', '0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.1); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 15];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2021 11 15];              

%% set data
% zero-variate data

data.tg = 34;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'Wiki';   
  temp.tg = C2K(38.1);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 15;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(38.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 45;   units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'Wiki';
  temp.tp = C2K(38.1); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5.2*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(38.1); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Sigmodon_hispidus';
  
data.Wwb = 7.3;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Hoff1963';
data.Wwi = 120;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Hoff1963';

data.Ri  = 6.7*4.5/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = {'Wiki','AnAge'};   
  temp.Ri = C2K(38.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-6 pups per litter; 6.7 litters per yr, based on Sigmodon_hispidus';
   
% univariate data
% time-weight
data.tWw = [ ... % time since birth (d), weight (g)
1.220	7.317
6.707	19.512
7.317	10.976
12.805	27.439
13.415	18.293
18.902	38.415
18.902	28.049
23.780	48.780
28.049	58.537
28.049	31.707
31.707	42.073
32.317	48.780
37.195	42.683
39.024	54.268
42.683	53.659
44.512	46.951
48.780	56.098
50.000	62.805
65.854	61.585
66.463	73.171
73.171	47.561
76.829	92.683
76.829	70.732
81.098	82.927
134.756	93.293
135.976	56.707
136.585	76.219
146.341	63.415
168.902	75.610
171.951	106.098
231.098	115.244
259.756	105.488
273.171	125.000
273.781	100.000
286.585	94.512
296.951	97.561
309.756	138.415
329.268	131.098];
units.tWw   = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw    = C2K(38.1);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature'; 
bibkey.tWw = 'Hoff1963';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 5 * weights.tWw;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '7WVGX'; % Cat of Life
metaData.links.id_ITIS = '180350'; % ITIS
metaData.links.id_EoL = '328442'; % Ency of Life
metaData.links.id_Wiki = 'Sigmodon_ochrognathus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '62415'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13000921'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sigmodon_ochrognathus}}';
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
bibkey = 'Hoff1963'; type = 'Article'; bib = [ ... 
'author = {Donald F. Hoffmeister}, ' ... 
'year = {1963}, ' ...
'title = {The Yellow-nosed Cotton Rat, \emph{Sigmodon ochrognathus}, in {A}rizona}, ' ...
'journal = {The American Midland Naturalist}, ' ...
'volume = {70(2)}, ' ...
'pages = {429-441}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Sigmodon_hispidus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

