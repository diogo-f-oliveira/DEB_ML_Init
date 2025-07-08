function [data, auxData, metaData, txtData, weights] = mydata_Panthera_tigris

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Felidae';
metaData.species    = 'Panthera_tigris'; 
metaData.species_en = 'Tiger'; 

metaData.ecoCode.climate = {'Am', 'Cfa'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvm', 'xiSvm'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.9); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 09 02];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 09 02]; 

%% set data
% zero-variate data

data.tg = 105;     units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.9);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 121;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.9);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1268;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 1415;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(37.9);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 26.3*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 1190;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 11003;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 105e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
  comment.Wwi = '75 and 110 kg for the Sumatran subspecies';
data.Wwim = 120e3; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight';    bibkey.Wwim = 'Wiki';
  comment.Wwim = '100 till 140 kg for the Sumatran subspecies';
  
data.Ri  = 2.5*0.4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2.5 pups per litter, 0.4 litters per yr';
  
% uni-variate data
% t-W data from Eras2008 for female, male 
data.tW_f = [ ... % time (d), female body weight (g)
0.758	985.435
2.078	1356.486
3.748	1313.152
5.065	1612.776
6.891	1912.254
8.494	2040.367
10.833	2453.985
12.580	2553.486
14.333	2824.414
16.665	3038.033
18.488	3237.512
20.599	3365.480
22.202	3493.594
23.514	3621.790
24.685	3864.313
27.380	4077.829
29.349	4277.266
31.968	4376.518
33.357	4633.264
35.686	4746.884
37.143	4846.468
39.697	5188.595
40.717	5288.304
42.178	5516.458
44.366	5772.975
46.335	5986.699
48.304	6186.136
50.416	6328.390];
units.tW_f = {'d', 'g'};  label.tW_f = {'time', 'wet weight'};  
temp.tW_f  = C2K(37.9);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Hugh1977';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 5 * weights.tW_f;
weights.Wwx = 0 * weights.Wwx;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Several sub-species occur that differ in maximum weight; this entry deals with the Sunda-Island subspecies: P.t.sondaica';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '4CGXS'; % Cat of Life
metaData.links.id_ITIS = '183805'; % ITIS
metaData.links.id_EoL = '328674'; % Ency of Life
metaData.links.id_Wiki = 'Panthera_tigris'; % Wikipedia
metaData.links.id_ADW = 'Panthera_tigris'; % ADW
metaData.links.id_Taxo = '67312'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14000259'; % MSW3
metaData.links.id_AnAge = 'Panthera_tigris'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Panthera_tigris}}';
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
bibkey = 'Hugh1977'; type = 'Article'; bib = [ ... 
'author = {Hughes, F.}, ' ... 
'doi = {10.1111/j.1748-1090.1977.tb00918.x}, ' ...
'year = {1977}, ' ...
'title = {Hand-rearing a {S}umatran tiger \emph{Panthera tigris sumatrae} at {W}hipsnade {P}ark}, ' ...
'journal = {International Zoo Yearbook}, ' ...
'volume = {17}, ' ...
'pages = {219-221}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Panthera_tigris}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

