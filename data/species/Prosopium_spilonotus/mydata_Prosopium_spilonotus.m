function [data, auxData, metaData, txtData, weights] = mydata_Prosopium_spilonotus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Prosopium_spilonotus'; 
metaData.species_en = 'Bonneville whitefish'; 

metaData.ecoCode.climate = {'BWk'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jFr', 'jiFl'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz','biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm   = [2020 09 11];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 09 11];


%% set data
% zero-variate data

data.am = 14*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'Thom2003';   
  temp.am = C2K(4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 18;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'Thom2003'; 
data.Li  = 45;   units.Li  = 'cm';  label.Li  = 'ultimate total length';     bibkey.Li  = 'Thom2003';

data.Wwb = 4.8e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'Shes2017';
  comment.Wwb = 'based on egg diameter of 2.1 mm (1.9 to 2.4 mm) for Prosopium cylindraceum: pi/6*0.21^3';
data.Wwp  = 38.8; units.Wwp  = 'g';	label.Wwp  = 'wet weight at puberty';    bibkey.Wwp  = {'fishbase','Thom2003'}; 
  comment.Wwp = 'based on 0.00457*Lp^3.13, see F1';
data.Wwi  = 683; units.Wwi  = 'g';	label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = {'fishbase','Thom2003'}; 
  comment.Wwi = 'based on 0.00457*Li^3.13, see F1';

% uni-variate data
% time-length
data.tL = [... %  time since birth (yr), total length (cm)
0.949	15.827
1.949	17.970
2.964	22.143
3.979	25.301
4.964	26.429
5.981	26.992
6.966	27.444
7.951	29.248
8.984	29.192
10.000	30.094
11.000	32.575];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Thom2003';

% length - fecundity
data.LN = [ ... % total length (log10 mm), fecundity (log10 #)
2.293	3.045
2.295	3.102
2.298	3.108
2.301	3.032
2.312	3.109
2.320	3.179
2.320	3.109
2.320	3.071
2.331	3.103
2.340	3.173
2.342	3.091
2.345	3.192
2.350	3.072
2.357	3.008
2.362	3.129
2.365	3.167
2.367	3.231
2.367	3.066
2.369	3.187
2.377	3.136
2.378	3.104
2.387	3.200
2.388	3.270
2.391	3.155
2.391	3.111
2.397	3.213
2.398	3.327
2.402	3.295
2.403	3.162
2.412	3.130
2.431	3.385
2.444	3.265
2.451	3.290
2.456	3.354
2.471	3.482
2.497	3.546
2.584	3.872
2.605	3.930
2.606	3.796
2.609	4.095
2.620	4.115
2.643	4.287];
data.LN = 10.^data.LN; % remove log transform
data.LN(:,1) = data.LN(:,1)/10; % convert mm to cm
units.LN   = {'cm', '#'};  label.LN = {'total length','fecundity'};  
temp.LN    = C2K(4);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Thom2003';

% length - weight
data.LWw = [ ... % total length (cm), wet weight (g)
10.920	1.942
11.573	3.883
11.629	3.883
11.954	5.825
12.281	5.825
12.662	9.709
12.934	9.709
13.315	11.650
13.697	11.650
13.969	11.650
14.568	15.534
14.840	13.592
15.276	13.592
15.548	15.534
15.765	21.359
15.876	11.650
16.147	17.476
16.473	23.301
16.584	13.592
16.963	27.184
16.963	27.184
17.020	13.592
17.344	27.184
17.564	17.476
17.564	15.534
17.725	31.068
17.941	36.893
18.326	19.417
18.487	34.951
18.652	25.243
18.816	21.359
19.085	38.835
19.305	29.126
19.683	46.602
19.684	38.835
20.067	31.068
20.285	33.010
20.390	54.369
20.717	54.369
20.884	33.010
21.102	34.951
21.206	58.252
21.427	44.660
21.533	58.252
21.808	42.718
21.858	67.961
22.028	33.010
22.078	58.252
22.131	67.961
22.516	48.544
22.569	56.311
22.728	77.670
22.894	62.136
23.165	71.845
23.222	58.252
23.324	95.146
23.440	58.252
23.546	71.845
23.819	69.903
23.925	85.437
24.147	66.019
24.306	87.379
24.524	91.262
24.527	71.845
24.528	66.019
24.798	79.612
24.902	104.854
24.961	83.495
25.182	66.019
25.288	81.553
25.290	71.845
25.447	104.854
25.448	99.029
25.615	81.553
25.882	110.680
25.884	97.087
26.044	116.505
26.158	89.320
26.317	112.621
26.540	89.320
26.645	108.738
26.650	83.495
26.865	99.029
27.024	124.272
27.185	135.922
27.189	114.563
27.190	108.738
27.729	139.806
27.788	116.505
27.844	104.854
28.003	130.097
28.165	141.748
28.279	110.680
28.438	137.864
28.439	130.097
28.442	112.621
28.653	153.398
28.655	141.748
28.870	155.340
28.929	130.097
29.149	122.330
29.205	112.621
29.306	155.340
29.309	141.748
29.310	133.981
29.465	180.583
29.467	170.874
29.469	157.282
29.796	157.282
29.853	143.689
29.957	168.932
30.062	192.233
30.066	172.816
30.181	139.806
30.338	172.816
30.610	172.816
30.667	163.107
30.716	190.291
30.782	128.155
30.821	211.651
30.937	176.699
31.150	201.942
31.319	172.816
31.378	145.631
31.482	172.816
31.749	203.883
31.752	186.408
31.907	233.010
31.976	153.398
32.128	217.476
32.185	201.942
32.507	227.184
32.838	205.825
34.190	264.078
34.351	275.728
34.845	252.427
35.382	295.146
35.495	273.786
35.869	316.505
36.358	320.388
36.473	291.262
36.631	318.447
36.797	302.913
37.281	337.864
38.413	407.767
39.823	442.718
40.479	431.068
40.524	483.495
40.789	522.330
41.436	559.223
41.442	528.155];
units.LWw   = {'cm', 'g'};  label.LWw = {'total length','wet weight'};  
bibkey.LWw = 'Thom2003';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: W in g = 0.00457 *(TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = '4MW9D'; % Cat of Life
metaData.links.id_ITIS = '162010'; % ITIS
metaData.links.id_EoL = '215644'; % Ency of Life
metaData.links.id_Wiki = 'Prosopium_spilonotus'; % Wikipedia
metaData.links.id_ADW = 'Prosopium_spilonotus'; % ADW
metaData.links.id_Taxo = '184832'; % Taxonomicon
metaData.links.id_WoRMS = '1525712'; % WoRMS
metaData.links.id_fishbase = 'Prosopium-spilonotus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Prosopium_spilonotus}}';
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
bibkey = 'Thom2003'; type = 'phdthesis'; bib = [ ... 
'author = {Thompson, Brett W.}, ' ... 
'year = {2003}, ' ...
'title = {An Ecological/Life History Comparison of Two Whitefish Species in {B}ear {L}ake, {U}tah/{I}daho}, ' ...
'school = {Utah State University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Shes2017'; type = 'Article'; bib = [ ... 
'doi = {10.1134/S0032945217020175}, ' ...
'author = {A. V. Shestakov}, ' ... 
'year = {2017}, ' ...
'title = {Biology of Round Whitefish \emph{Prosopium cylindraceum} ({C}oregonidae) of the {A}nadyr {R}iver}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'volume = {57}, ' ...
'pages = {257-264}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Prosopium-spilonotus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

