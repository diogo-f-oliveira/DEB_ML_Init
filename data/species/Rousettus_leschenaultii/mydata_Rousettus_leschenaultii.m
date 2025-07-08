function [data, auxData, metaData, txtData, weights] = mydata_Rousettus_leschenaultii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Pteropodidae';
metaData.species    = 'Rousettus_leschenaultii'; 
metaData.species_en = 'Leschenault''s rousette'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHs','xiHn'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011


metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 06 23];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 06 23]; 

%% set data
% zero-variate data

data.tg = 115;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'AnAge';   
  temp.tg = C2K(34.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 45;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'AnAge';   
  temp.tx = C2K(34.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 150;    units.tp = 'd';    label.tp = 'time since birth at first litter female';  bibkey.tp = 'AnAge';
  temp.tp = C2K(34.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '455 d for males';
data.am = 14*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(34.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 9.5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth for female';  bibkey.Wwb = 'ElanRagh2002';
data.Wwi = 111.25;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'AnAge';

data.Ri  = 2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(34.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pup per litter; 2 litters per yr';

% uni-variate data
% time-weight
data.tW1 = [ ... % time since birth (d), weight (g)
4.534	10.971
9.264	12.412
15.375	14.353
20.499	17.222
24.639	20.958
30.355	22.960
34.888	24.463
40.407	26.651
44.744	27.532
50.066	29.037
55.191	30.479
60.315	29.997
64.849	32.058
70.368	32.757
74.901	33.080
80.026	34.088
85.940	34.540
90.276	34.056
95.204	35.063
100.131	35.574
105.256	36.023
109.987	36.037
115.112	36.051
119.842	36.065
124.770	36.638
129.895	37.025];
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight', '#1'};  
temp.tW1    = C2K(34.8);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'ElanRagh2002';
%
data.tW2 = [ ... % time since birth (d), weight (g)
4.534	9.978
9.264	11.605
14.980	13.173
19.711	14.490
25.033	16.677
30.158	17.685
34.494	18.814
38.830	19.013
44.547	20.023
49.869	21.279
60.118	24.101
65.046	25.047
68.791	29.091
69.974	25.868
74.310	28.114
79.632	27.571
84.363	28.143
90.079	29.959
95.007	33.077
100.329	34.023
105.453	34.100
110.184	34.113
114.915	35.616
120.237	35.011
125.164	35.088
129.501	35.721];
units.tW2   = {'d', 'g'};  label.tW2 = {'time since birth', 'wet weight', '#2'};  
temp.tW2    = C2K(34.8);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2 = 'ElanRagh2002';
%
data.tW3 = [ ... % time since birth (d), weight (g)
4.731	11.964
9.855	14.151
14.980	16.958
20.105	19.455
24.836	20.028
30.749	20.727
34.888	23.222
40.210	23.982
44.547	26.104
49.869	25.995
55.782	27.254
60.118	27.515
65.243	28.026
69.382	29.217
75.493	30.103
80.421	31.111
85.151	31.062
90.276	31.325
94.415	32.578
100.329	33.030
105.650	33.604
109.987	33.616
115.506	34.129
120.039	34.080
125.361	34.468
130.289	34.916];
units.tW3   = {'d', 'g'};  label.tW3 = {'time since birth', 'wet weight', '#3'};  
temp.tW3    = C2K(34.8);  units.temp.tW3 = 'K'; label.temp.tW3 = 'temperature';
bibkey.tW3 = 'ElanRagh2002';
%
data.tW4 = [ ... % time since birth (d), weight (g)
4.139	10.287
9.461	12.226
14.192	13.357
19.908	14.490
24.244	16.489
29.961	18.057
34.691	18.691
40.407	19.204
45.335	20.583
49.277	22.953
54.402	24.830
59.921	27.514
64.849	27.652
69.974	28.908
75.690	30.042
79.632	30.984
84.757	30.689
89.685	31.510
95.204	31.091
100.131	31.602
104.468	32.049
109.593	32.064
114.915	32.948
120.631	32.158
125.756	32.607
130.880	33.180];
units.tW4   = {'d', 'g'};  label.tW4 = {'time since birth', 'wet weight', '#4'};  
temp.tW4    = C2K(34.8);  units.temp.tW4 = 'K'; label.temp.tW4 = 'temperature';
bibkey.tW4 = 'ElanRagh2002';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tW1 = 5 * weights.tW1;
%weights.Wwb = 5 * weights.Wwb;
%weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; 
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW1','tW2','tW3','tW4'}; subtitle1 = {'Data for individual 1,2,3,4'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Body temperature is guessed';
D2 = 'Males are assumed not to differ from females';
D3 = 'scaled function response during lactation is assume to be larger than post-weaning';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '799XV'; % Cat of Life
metaData.links.id_ITIS = '945995'; % ITIS
metaData.links.id_EoL = '323426'; % Ency of Life
metaData.links.id_Wiki = 'Rousettus_leschenaultii'; % Wikipedia
metaData.links.id_ADW = 'Rousettus_leschenaultii'; % ADW
metaData.links.id_Taxo = '1684281'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13800413'; % MSW3
metaData.links.id_AnAge = 'Rousettus_leschenaultii'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rousettus_leschenaultii}}';
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
bibkey = 'ElanRagh2002'; type = 'Article'; bib = [ ... 
'doi = {10.3161/150811009X465721}, ' ...
'author = {V. Elangovan and H. Raghuram and E. Yuvana Satya Priya and G. Marimuthu}, ' ... 
'year = {2002}, ' ...
'title = {Postnatal growth, age estimation and development of foraging behaviour in the fulvous fruit bat \emph{Rousettus leschenaulti}}, ' ...
'journal = {J. Biosci.}, ' ...
'volume = {27}, ' ...
'pages = {695–702}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Rousettus_leschenaultii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

