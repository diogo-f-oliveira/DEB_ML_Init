function [data, auxData, metaData, txtData, weights] = mydata_Caiman_latirostris
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Crocodilia'; 
metaData.family     = 'Alligatoridae';
metaData.species    = 'Caiman_latirostris'; 
metaData.species_en = 'Broad-snouted caiman'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0bTd', 'biFc', 'biFr'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bpCi', 'bpCva', 'biCvf'};
metaData.ecoCode.gender  = {'Dtfm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 09 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 09 17];


%% set data
% zero-variate data

data.ab = 70;      units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'ADW';   
  temp.ab = C2K(31); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 7.9*365;      units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ViotNava2020';   
  temp.tp = C2K(23); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 58*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 69*200/80;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'ViotNava2020'; 
  comment.Lp = 'converted from SVL using TL = SVL*200/80';
data.Li  = 350;     units.Li  = 'cm';  label.Li  = 'ultimate total length for female'; bibkey.Li  = 'Wiki';

data.Wwb = 30;    units.Wwb = 'g';  label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'ADW';
data.Wwi = 62e3;    units.Wwi = 'g';  label.Wwi = 'ultimate wet weight of female';  bibkey.Wwi = 'Wiki';

data.Ri  = 45/365;  units.Ri  = '#/d'; label.Ri  = 'max reprod rate';   bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(23);units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '20-50 eggs per clutch, 1 clutch per yr assumed';

% univariate data
% time-length
data.tL = [ ... time since birth (yr), SVL (cm)
0.088	13.178
0.088	13.056
0.351	13.058
0.439	14.522
0.439	13.790
0.556	12.816
0.673	15.500
0.673	14.890
0.731	11.232
0.731	12.086
0.789	22.818
0.789	23.793
0.789	16.964
0.819	20.135
0.906	13.185
0.936	15.746
1.082	14.162
1.667	29.410
1.667	17.215
1.696	41.362
1.725	37.703
1.725	21.118
1.754	31.362
1.754	23.313
1.754	23.801
1.784	33.801
1.784	17.948
1.813	19.168
1.842	28.070
1.842	20.265
1.901	16.851
1.901	16.241
1.959	20.022
1.988	22.462
1.988	18.071
2.018	19.169
2.076	24.048
2.076	21.609
2.164	22.585
2.602	30.271
2.661	34.662
2.661	36.248
2.719	47.955
2.719	47.468
2.719	42.955
2.719	30.882
2.807	30.029
2.865	25.152
3.129	25.520
3.596	36.133
3.655	41.012
3.655	36.622
3.772	35.159
3.860	47.721
4.064	30.649
5.058	42.121
6.988	75.429
7.047	68.234
7.778	70.070
8.684	67.272
8.713	80.443
8.801	73.980
8.801	68.127
9.006	71.909
9.123	68.007
9.152	64.959
9.737	58.622
9.854	78.257
9.883	72.526
9.942	70.453
9.971	71.429
11.023	77.169
11.667	79.248
11.813	78.151
13.918	69.754
14.854	71.956
15.877	77.331
16.053	77.088
16.871	76.485
16.871	79.046
16.930	78.559
17.690	79.297
17.807	80.273
17.807	73.200
17.895	69.664];
data.tL(:,1) = data.tL(:,1)*365; % convert yr to d
data.tL(:,2) = data.tL(:,2)*200/80; % convert SVL to TL
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL  = C2K(23);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ViotNava2020';
comment.tL = 'SVL was converted to TL with TL = 200/80 SVL';

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

%% Discussion points
D1 = 'Males are assumed to not differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'temperature effects sex of neonate';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'PBBS'; % Cat of Life
metaData.links.id_ITIS = '202213'; % ITIS
metaData.links.id_EoL = '795540'; % Ency of Life
metaData.links.id_Wiki = 'Caiman_latirostris'; % Wikipedia
metaData.links.id_ADW = 'Caiman_latirostris'; % ADW
metaData.links.id_Taxo = '50620'; % Taxonomicon
metaData.links.id_WoRMS = '1478602'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Caiman&species=latirostris'; % ReptileDB
metaData.links.id_AnAge = 'Caiman_latirostris'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Caiman_latirostris}}';
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
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Caiman_latirostris/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Caiman_latirostris}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ViotNava2020'; type = 'Article'; bib = [ ... 
'doi = {10.2994/SAJH-D-18-00077.1}, ' ...    
'author = {Evangelina V. Viotto and Joaqu\''{i}n L. Navarro and Carlos I. Pi\~{n}a}, ' ...
'title  = {Growth Curves of Wild and Reintroduced Broad‑Snouted Caimans (\emph{Caiman latirostris}) and Their Management Implications}, ' ...
'year = {2020}, ' ...
'journal = {South American Journal of Herpetology}, ' , ...
'pages = {34–41}, '...
'volume = {16}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

