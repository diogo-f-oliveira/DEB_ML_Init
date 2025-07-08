function [data, auxData, metaData, txtData, weights] = mydata_Hoplostethus_atlanticus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Trachichthyiformes'; 
metaData.family     = 'Trachichthyidae';
metaData.species    = 'Hoplostethus_atlanticus'; 
metaData.species_en = 'Orange roughy'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0jMp', 'jiMpb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 03 31];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 03 31]; 


%% set data
% zero-variate data

data.am = 130*365;    units.am = 'd';    label.am = 'life span';            bibkey.am = 'AllaLora2000';   
  temp.am = C2K(6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 37;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 75;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 0.0082;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 2.5 mm: 4/3*pi*0.125^3';
data.Wwi = 7000;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = '';

data.Ri = 103570/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
temp.Ri = C2K(6);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'data from Cook Canyon';
  
% univariate data
Lt = [ ... % total length (cm), age (yr)
11.577	1.967
12.504	2.250
14.472	1.669
14.935	3.389
15.282	1.667
15.745	3.099
16.208	2.811
16.556	2.809
16.556	4.531
16.556	3.383
16.671	4.530
17.250	2.807
17.366	4.815
17.713	7.395
17.945	3.665
19.103	8.251
19.913	3.658
20.029	10.830
20.029	7.100
20.955	7.384
20.955	9.105
20.955	11.687
21.187	4.801
21.997	6.806
22.113	8.527
22.113	9.962
22.113	12.831
22.923	9.672
22.923	11.106
22.923	12.828
23.039	7.950
23.039	11.967
23.039	14.835
23.271	18.277
23.386	10.531
23.502	13.973
23.734	14.833
23.849	7.947
23.965	20.283
24.081	13.110
24.081	11.963
24.081	10.815
24.081	9.381
24.197	15.979
24.660	12.248
24.660	8.518
24.891	14.542
25.007	20.279
25.007	10.525
25.123	13.967
25.702	9.662
25.702	8.514
26.165	7.939
26.165	9.660
26.165	11.382
26.165	12.529
26.397	15.971
26.628	11.667
27.091	11.665
27.091	13.100
27.091	15.108
28.133	9.653
28.133	10.801
28.828	14.241
28.944	10.224
28.944	11.945
29.059	23.420
29.175	16.535
29.986	14.237
30.101	10.794
30.101	13.376
30.101	16.531
30.101	19.974
30.101	23.417
30.217	25.138
31.027	11.364
31.027	18.249
31.027	23.700
31.027	25.995
31.143	15.093
31.375	21.117
31.954	10.500
31.954	13.656
32.069	25.705
32.069	22.262
32.185	16.237
32.185	19.106
32.185	20.827
32.648	18.530
32.880	15.948
33.111	19.103
35.080	18.809
35.080	23.399
35.890	15.363
36.006	20.240
36.122	22.248
36.122	21.674
37.279	10.768
37.974	13.347
37.974	19.085
37.974	21.954
37.974	23.675
37.974	24.536
37.974	31.995
39.132	17.073
39.132	19.942
40.058	17.069
41.100	19.648
41.100	20.795
41.100	22.230
41.447	33.417
43.184	24.230
43.184	26.525
45.152	31.395
46.078	31.392
46.078	37.130
47.236	22.208
47.236	40.281
51.172	32.808
53.140	26.203
53.835	37.963
54.993	20.459
54.993	41.688
55.919	35.947
56.035	43.979
57.077	70.082
57.887	79.260
58.929	74.953
59.161	37.370
59.971	51.711
59.971	72.367
60.087	75.522
60.897	70.642
61.129	39.945
61.129	69.207
61.823	74.942
61.823	116.254
61.939	51.417
62.981	49.692
63.907	62.312
63.907	75.795
65.181	52.553
66.107	68.042
67.033	54.555
69.117	37.334];
data.tL = Lt(:,[2 1]); data.tL(:,1) = 365*data.tL(:,1);
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'AllaLora2000';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Temp 3-9 C, preferred 19 C (but hard to believe, given deep-water occurrence: depth range 180 - 1809 m, usually 400-900 m deep)';
metaData.bibkey.F1 = 'fishbase'; 
F2 = ''; 
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3MN73'; % Cat of Life
metaData.links.id_ITIS = '166139'; % ITIS
metaData.links.id_EoL = '46567305'; % Ency of Life
metaData.links.id_Wiki = 'Hoplostethus_atlanticus'; % Wikipedia
metaData.links.id_ADW = 'Hoplostethus_atlanticus'; % ADW
metaData.links.id_Taxo = '153363'; % Taxonomicon
metaData.links.id_WoRMS = '126402'; % WoRMS
metaData.links.id_fishbase = 'Hoplostethus-atlanticus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hoplostethus_atlanticus}}';
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
bibkey = 'AllaLora2000'; type = 'Article'; bib = [ ... 
'author = {V. Allain and P. Lorance}, ' ... 
'year = {2000}, ' ...
'title = {AGE ESTIMATION AND GROWTH OF SOME DEEP-SEA FISH FROM THE {N}ORTHEAST {A}TLANTIC {O}CEAN}, ' ...
'journal = {Cybium}, ' ...
'volume = {24}, ' ...
'number = {3, suppl}, '...
'pages = {7--16}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Hoplostethus-atlanticus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

