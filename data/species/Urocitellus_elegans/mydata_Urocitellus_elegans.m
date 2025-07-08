function [data, auxData, metaData, txtData, weights] = mydata_Urocitellus_elegans

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Sciuridae';
metaData.species    = 'Urocitellus_elegans'; 
metaData.species_en = 'Wyoming ground squirrel'; 

metaData.ecoCode.climate = {'BSk'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTg', '0iTs'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiH', 'xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L';'t_Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 03];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2021 11 03];              

%% set data
% zero-variate data

data.tg = 22.5;    units.tg = 'd';     label.tg = 'gestation time';                bibkey.tg = 'ADW';   
  temp.tg = C2K(35.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '22 till 23 d';
data.tx = 35;    units.tx = 'd';     label.tx = 'time since birth at weaning';   bibkey.tx = 'ADW';   
  temp.tx = C2K(35.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '28-42 d';
data.tp = 365;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'ADW';
  temp.tp = C2K(35.5); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 365;   units.tpm = 'd';     label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'ADW';
  temp.tpm = C2K(35.5); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 4*365;    units.am = 'd'; label.am = 'life span';                    bibkey.am = 'ADW';   
  temp.am = C2K(35.5); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'Data from Urocitellus_richardsonii and uncertain';
  
data.Wwb = 7;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'KoepHoff1981';
data.Wwi = 350;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'ADW';
  comment.Wwi = '255-396 g';

data.Ri  = 6.5/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(35.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 to 11 pups per litter; 1 litter per yr';

% uni-variate data

% time-length data
data.tL = [ ... % time since birth (d), head+body length (g)
0.069	5.589
3.658	6.709
6.628	7.772
9.474	8.490
12.445	9.352
15.167	10.070
18.261	11.075
20.736	11.793
23.335	12.684
26.058	13.574
29.771	15.038
32.494	16.158
34.721	17.048
37.320	18.110
39.548	18.885
42.023	19.575
45.364	20.007
48.087	20.410
50.686	20.726
54.894	20.901
57.864	20.989
61.577	21.020
66.527	20.994
69.250	21.282
74.571	21.400
78.903	21.001
81.626	21.003];
units.tL  = {'d', 'cm'};  label.tL = {'time', 'head+body length'};  
temp.tL  = C2K(35.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KoepHoff1981';

% time-weight data
data.tWw = [ ... % time since birth (d), weight (g)
0.251	7.137
5.951	17.787
9.421	24.890
12.891	31.992
16.736	41.944
21.942	53.311
25.178	70.398
28.672	96.751
31.046	116.697
33.796	141.631
36.305	170.844
38.935	198.631
42.934	232.824
44.809	249.921
48.791	270.567
53.265	289.783
58.482	309.706
62.238	348.179
66.342	367.398
69.828	387.335
74.029	385.162
78.300	440.030
82.098	412.193];
units.tWw  = {'d', 'g'};  label.tWw = {'time', 'wet weight'};  
temp.tWw  = C2K(35.5);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'KoepHoff1981';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
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
D1 = 'Males are assumend to differ from females by E_Hp only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '7DTRY'; % Cat of Life
metaData.links.id_ITIS = '930319'; % ITIS
metaData.links.id_EoL = '328003'; % Ency of Life
metaData.links.id_Wiki = 'Urocitellus_elegans'; % Wikipedia
metaData.links.id_ADW = 'Spermophilus_elegans'; % ADW
metaData.links.id_Taxo = '5726071'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12401020'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Urocitellus_elegans}}';
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
bibkey = 'KoepHoff1981'; type = 'Article'; bib = [ ... 
'author = {J. W. Koeppl and R. S. Hoffmann}, ' ... 
'year = {1981}, ' ...
'title = {Comparative Postnatal Growth of Four Ground Squirrel Species}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {62(1)}, ' ...
'pages = {41-57}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Spermophilus_elegans/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

