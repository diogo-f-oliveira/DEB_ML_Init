function [data, auxData, metaData, txtData, weights] = mydata_Sepia_apama
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Sepiida'; 
metaData.family     = 'Sepiidae';
metaData.species    = 'Sepia_apama'; 
metaData.species_en = 'Giant cuttlefish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MISE','MPSW'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'L-Ww';'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 06 20];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 06 20]; 

%% set data
% zero-variate data

data.ab = 4*30.5;     units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = 'Wiki';   
  temp.ab = C2K(21);     units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = '3-5 mnth';
data.tp = 1*365;     units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'Wiki';   
  temp.tp = C2K(21);     units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 1.7*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(21);     units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = '1-2 yr';

data.Li = 50;    units.Li = 'cm';   label.Li = 'mantle length at death';   bibkey.Li = 'Wiki';

data.Wwb = 0.0645;    units.Wwb = 'g';   label.Wwb = 'weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 5 mm of Sepia elegans: pi/6*0.5^3';
data.Wwi = 10500;    units.Wwi = 'g';   label.Wwi = 'weight at death';   bibkey.Wwi = 'Wiki';

data.Ni  = 300; units.Ni  = '#';   label.Ni  = 'cum reprod at Li ';     bibkey.Ni  = 'ADW';   
  temp.Ni = C2K(21);    units.temp.Ni = 'K'; label.temp.Ni = 'temperature';

% uni-variate data

% length-weight
data.LWw = [ ... % mantle length (cm), wet weight (g)
3.302	13.374
8.804	87.873
11.046	227.328
11.495	263.652
11.780	215.574
11.943	366.242
12.024	215.672
12.065	275.930
12.106	378.356
12.473	227.901
12.514	378.520
12.758	246.088
12.880	216.016
13.003	240.162
13.084	324.532
13.573	324.728
14.959	409.622
15.367	518.220
18.995	863.050
22.989	1214.052
24.008	1726.509
24.538	2076.120
26.005	1540.564
26.535	1968.488];
units.LWw   = {'cm', 'g'};  label.LWw = {'mantle length', 'wet weight'};  
bibkey.LWw = 'ODorAitk2005';

data.tWw = [ ... % time since birth (d), wet weight (g)
90.329	8.905
270.510	105.098
301.241	217.296
305.004	216.215
326.525	236.946
330.317	273.968
372.221	232.691
412.658	381.924
415.233	233.873
422.259	281.789
426.635	379.777
435.351	527.852
436.766	269.846
443.867	415.740];
units.tWw   = {'d', 'g'};  label.tWw= {'time time birth', 'wet weight'};  
temp.tWw    = C2K(21);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'ODorAitk2005';
    
%% set weights for all real data
weights = setweights(data, []);
weights.am = 10 * weights.am;
weights.Wwi = 3 * weights.Wwi;
weights.tWw = 3 * weights.tWw;
weights.ab = 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females, due to lack of data';
D2 = 'Temperatures are guessed';
D3 = 'ab is ignored due to inconsistency with other data; perhaps t_0 is large'; 
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Only known mass cuttlefish spawning aggregation in upper Spencer Gulf, Australia';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4WQGV'; % Cat of Life
metaData.links.id_ITIS = '556150'; % ITIS
metaData.links.id_EoL = '46475437'; % Ency of Life
metaData.links.id_Wiki = 'Sepia_apama'; % Wikipedia
metaData.links.id_ADW = 'Sepia_apama'; % ADW
metaData.links.id_Taxo = '40201'; % Taxonomicon
metaData.links.id_WoRMS = '342111'; % WoRMS
metaData.links.id_molluscabase = '342111'; % molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sepia_apama}}';
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
bibkey = 'ODorAitk2005'; type = 'article'; bib = [ ...
'doi = {10.4194/1303-2712-v15_2_08}, ' ...
'author = {Ron O''Dor and Jill Aitken and George D. Jackson}, ' ... 
'year = {2005}, ' ...
'title = {ENERGY BALANCE GROWTH MODELS: {A}PPLICATIONS TO CEPHALOPODS}, ' ...
'journal = {Phuket mar. biol. Cent. Res. Bull.}, ' ...
'volume = {66}, ' ...
'pages = {329-336}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Sepia-apama.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Sepia_apama/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

