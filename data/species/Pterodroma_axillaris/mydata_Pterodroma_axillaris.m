function [data, auxData, metaData, txtData, weights] = mydata_Pterodroma_axillaris
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Procellariiformes'; 
metaData.family     = 'Procellariidae';
metaData.species    = 'Pterodroma_axillaris'; 
metaData.species_en = 'Chatham petrel'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MPS'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tntfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCvf', 'biCik', 'biCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.4); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm = [2018 09 21];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 06 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 30];

%% set data
% zero-variate data

data.ab = 47;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Gard1999';   
  temp.ab = C2K(37.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 84.7; units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Gard1999';   
  temp.tx = C2K(37.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 84.7*3; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(37.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 2*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(37.4); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 25*365;   units.am = 'd';    label.am = 'life span';           bibkey.am = 'guess';   
  temp.am = C2K(37.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 45; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Gard1999';
data.Wwi = 630; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'Gard1999';
  comment.Wwi = 'asymptote for nestling; mean adult weight is lower: mean 206 g, range 176-236 g ';

data.Ri  = 1/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(37.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data      
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0       45 
3.641	61.508
3.655	39.683
4.605	54.563
6.037	66.468
7.312	75.397
7.484	56.548
8.756	68.452
9.062	90.278
9.867	83.333
9.869	79.365
10.958	127.976
11.153	73.413
11.774	103.175
11.779	95.238
12.386	146.825
12.396	130.952
13.663	151.786
13.844	119.048
14.316	130.952
14.950	140.873
15.547	208.333
15.599	126.984
16.535	163.690
16.703	150.794
18.441	185.516
18.478	127.976
20.244	118.056
20.363	183.532
20.697	161.706
20.711	138.889
21.293	230.159
21.808	174.603
22.587	208.333
22.742	215.278
23.401	185.516
23.712	199.405
23.729	173.611
24.479	251.984
24.816	225.198
25.498	159.722
25.776	225.198
25.790	202.381
26.403	246.032
26.717	253.968
26.902	215.278
27.073	198.413
27.213	230.159
28.341	217.262
28.605	304.564
28.818	222.222
28.985	210.317
29.425	272.817
29.608	238.095
30.874	259.921
31.037	253.968
31.525	242.063
32.170	234.127
32.441	310.516
32.627	270.833
32.953	260.913
33.444	244.048
33.746	271.825
34.682	309.524
34.697	286.706
34.880	250.000
35.503	275.794
36.640	250.000
37.110	264.881
37.733	291.667
37.770	234.127
38.543	276.786
38.676	318.452
39.801	310.516
39.827	270.833
40.612	293.651
41.041	374.008
41.407	301.587
41.757	253.968
42.676	318.452
42.712	261.905
42.987	333.333
43.042	247.024
43.665	273.810
43.668	268.849
44.449	298.611
44.752	325.397
44.757	317.460
45.590	265.873
45.676	380.952
45.888	300.595
46.346	334.325
46.693	291.667
46.832	324.405
47.403	433.532
47.636	318.452
49.242	309.524
49.391	326.389
49.505	397.817
49.527	364.087
49.865	336.310
50.680	312.500
51.263	400.794
51.783	338.294
51.954	322.421
52.726	365.079
53.542	341.270
53.959	439.484
54.352	325.397
54.638	377.976
54.814	353.175
55.121	373.016
55.749	392.857
56.538	409.722
56.712	387.897
56.764	305.556
57.065	336.310
57.669	392.857
57.681	373.016
57.860	343.254
58.137	410.714
58.994	321.429
59.743	400.794
59.760	375.000
60.229	392.857
60.272	324.405
60.731	357.143
61.193	385.913
61.516	380.952
62.633	385.913
62.642	372.024
63.298	347.222
64.114	321.429
64.382	402.778
64.395	382.937
64.583	339.286
65.365	367.063
65.399	314.484
65.999	376.984
66.173	354.167
66.504	337.302
66.804	368.056
67.164	306.548
67.632	325.397
68.253	355.159
68.257	348.214
68.447	301.587
69.072	325.397
69.219	345.238
69.382	340.278
69.416	287.698
69.868	331.349
70.035	320.437
70.504	337.302
70.700	281.746
71.823	275.794
71.954	321.429
72.124	305.556
72.312	262.897
72.759	313.492
73.595	257.937
74.048	300.595
74.400	250.000
74.534	290.675
74.700	281.746
75.187	269.841
75.523	245.040
75.785	336.310
76.326	241.071
76.943	276.786
76.947	269.841
76.952	262.897
77.610	234.127
78.234	258.929
78.550	264.881
78.575	226.190
79.677	253.968
80.184	212.302
81.123	246.032
82.076	255.952
82.888	237.103
83.540	218.254
85.137	223.214
85.948	206.349];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(37.4);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Gard1999';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Feeding is reduced towards end of nestling period';
D2 = 'Long tp cannot be captured by std model';
D3 = 'Body temperature of Oceanodroma furcata (Youn2013), but that of chick down to 10 C';
D4 = 'mod_1: Puberty is assumed to coincide with fledging with a waiting time to first brood';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was support by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '4PWK7'; % Cat of Life
metaData.links.id_ITIS = '174583'; % ITIS
metaData.links.id_EoL = '1049478'; % Ency of Life
metaData.links.id_Wiki = 'Pterodroma_axillaris'; % Wikipedia
metaData.links.id_ADW = 'Pterodroma_axillaris'; % ADW
metaData.links.id_Taxo = '51527'; % Taxonomicon
metaData.links.id_WoRMS = '225989'; % WoRMS
metaData.links.id_avibase = 'C398A0EAADB5801E'; % avibase
metaData.links.id_birdlife = 'chatham-petrel-pterodroma-axillaris'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pterodroma_axillaris}}';
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
bibkey = 'Gard1999'; type = 'Incollection'; bib = [ ... 
'author = {Gardner, P.}, ' ... 
'year = {1999}, ' ...
'title = {Aspects of the breeding biology of the {C}hatham petrel (\emph{Pterodroma axillaris})}, ' ...
'journal = {Science for Conservation}, ' ...
'volume = {131A}, ' ...
'pages = {5-21}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'arkive'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.arkive.org/henderson-petrel/Pterodroma-axillaris/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


