function [data, auxData, metaData, txtData, weights] = mydata_Rattus_lutreolus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Muridae';
metaData.species    = 'Rattus_lutreolus'; 
metaData.species_en = 'Australian swamp rat'; 

metaData.ecoCode.climate = {'Cfa', 'Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iFm'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH', 'xiCii', 'xiF'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.7); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2018 01 01];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2018 01 01];              

%% set data
% zero-variate data

data.tg = 27;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(36.7);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 25;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(36.7);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 79;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(36.7); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 4.4*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36.7); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 4.87;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 25;   units.Wwx = 'g';     label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'AnAge';
data.Wwi = 115;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 5*2.53/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '5 pups per litter; 2.53 litters per yr';

% univariate data
% time-weight
data.tWw_1f = [ ... % time since birth (d), ln weight (g)
0.071	1.7134
0.894	1.7877
1.719	1.8991
3.017	2.0941
3.847	2.2800
5.025	2.4379
5.964	2.4935
6.553	2.5584
6.901	2.5118
7.610	2.6419
8.901	2.7160
10.076	2.7995
10.781	2.8551
10.781	2.8551
11.957	2.9665
14.071	3.1148
14.893	3.1705
15.599	3.2447
16.536	3.2724
17.940	3.2721
18.877	3.2998
20.514	3.2994
21.686	3.3270
23.210	3.4011
24.734	3.4472
25.903	3.4377
26.960	3.5211
29.536	3.5763
32.582	3.6501
36.207	3.6492];
data.tWw_1f(:,2) = exp(data.tWw_1f(:,2)); % remove ln transform
units.tWw_1f   = {'d', 'g'};  label.tWw_1f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_1f    = C2K(36.7);  units.temp.tWw_1f = 'K'; label.temp.tWw_1f = 'temperature'; 
bibkey.tWw_1f = 'Fox1979';
comment.tWw_1f = 'Data for female';
%
data.tWw_2f = [ ... % time since birth (d), ln weight (g)
0.031	1.6843
2.050	1.8598
2.893	1.9985
4.087	2.1371
6.824	2.4050
9.074	2.5618
12.041	2.8112
13.711	2.9960
14.881	2.9957
15.711	3.0603
16.884	3.0786
17.935	3.0691
18.771	3.1707
19.708	3.1798
21.112	3.1794
21.823	3.2348
22.764	3.2624
24.054	3.2806
27.726	3.5483
29.135	3.5757];
data.tWw_2f(:,2) = exp(data.tWw_2f(:,2)); % remove ln transform
units.tWw_2f   = {'d', 'g'};  label.tWw_2f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_2f    = C2K(36.7);  units.temp.tWw_2f = 'K'; label.temp.tWw_2f = 'temperature'; 
bibkey.tWw_2f = 'Fox1979';
comment.tWw_2f = 'Data for female';
%
data.tWw_1m = [ ... % time since birth (d), ln weight (g)
0.000	1.4995
0.688	1.6361
1.514	1.7516
2.806	1.8566
6.459	2.3082
7.980	2.3184
9.386	2.3601
10.327	2.4651
11.738	2.5805
12.672	2.5592
13.495	2.6327
14.317	2.6851
15.955	2.6952
16.540	2.6951
17.592	2.6948
18.765	2.7471
19.817	2.7468
20.637	2.7571
21.342	2.8096
22.512	2.8198
23.802	2.8826
24.856	2.9034
26.146	2.9662
27.440	3.0922
29.553	3.2179
33.657	3.4063];
data.tWw_1m(:,2) = exp(data.tWw_1m(:,2)); % remove ln transform
units.tWw_1m   = {'d', 'g'};  label.tWw_1m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_1m    = C2K(36.7);  units.temp.tWw_1m = 'K'; label.temp.tWw_1m = 'temperature'; 
bibkey.tWw_1m = 'Fox1979';
comment.tWw_1m = 'Data for male';
%
data.tWw_2m = [ ... % time since birth (d), ln weight (g)
0.001	1.5008
0.828	1.6401
1.771	1.7608
2.829	1.8629
3.656	1.9930
4.602	2.1695
5.426	2.2623
6.835	2.3643
7.540	2.4107
8.597	2.4941
9.656	2.5962
10.245	2.6705
11.301	2.7261
13.296	2.8372
14.465	2.8370
15.517	2.8274
16.340	2.9016
17.627	2.9106
19.152	2.9754
22.084	3.1143
25.596	3.1786
29.695	3.2706];
data.tWw_2m(:,2) = exp(data.tWw_2m(:,2)); % remove ln transform
units.tWw_2m   = {'d', 'g'};  label.tWw_2m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_2m    = C2K(36.7);  units.temp.tWw_2m = 'K'; label.temp.tWw_2m = 'temperature'; 
bibkey.tWw_2m = 'Fox1979';
comment.tWw_2m = 'Data for male';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = 5 * weights.Wwi;

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

%% Group plots
set1 = {'tWw_1f','tWw_2f','tWw_1m','tWw_2m'}; subtitle1 = {'Data for females (2), males (2)'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '4RM5H'; % Cat of Life
metaData.links.id_ITIS = '585533'; % ITIS
metaData.links.id_EoL = '1179381'; % Ency of Life
metaData.links.id_Wiki = 'Rattus_lutreolus'; % Wikipedia
metaData.links.id_ADW = 'Rattus_lutreolus'; % ADW
metaData.links.id_Taxo = '63130'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13001755'; % MSW3
metaData.links.id_AnAge = 'Rattus_lutreolus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rattus_lutreolus}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Rattus_lutreolus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Fox1979'; type = 'Article'; bib = [ ... 
'doi = {10.1071/zo9790945}, ' ...
'author = {Fox, B. J.}, ' ... 
'year = {1979}, ' ...
'title = {Growth and development of \emph{Rattus lutreolus} ({R}odentia : {M}uridae) in the laboratory}, ' ...
'journal = {Australian Journal of Zoology}, ' ...
'volume = {27}, ' ...
'number = {6}, ' ...
'pages = {945-957}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

