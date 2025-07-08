function [data, auxData, metaData, txtData, weights] = mydata_Kryptolebias_marmoratus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Rivulidae';
metaData.species    = 'Kryptolebias_marmoratus'; 
metaData.species_en = 'Mangrove killifish'; 

metaData.ecoCode.climate = {'Af', 'Am', 'Cfa'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFm', '0iMm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Hsmm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ww_L'; 'GSI'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2012 05 08];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 10 18];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 18]; 

%% set data
% zero-variate data

data.ab = 20;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'SakaNoak2000';   
  temp.ab = C2K(26);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '20-90 d, lower boundary of range was selected because of embryonic diapause in the species';
data.ap = 35;      units.ap = 'd';    label.ap = 'age at puberty';            bibkey.ap = 'SakaNoak2000';
  temp.ap = C2K(26);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 4 * 365;    units.am = 'd'; label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.51;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'SakaNoak2000';  
data.Lp  = 1.7;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'SakaNoak2000'; 
data.Li  = 4.5;    units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'GargSaka2004';

data.Ww2 = 0.15;   units.Ww2 = 'g';   label.Ww2 = 'wet weight at 2.64 cm';    bibkey.Ww2 = 'ParkAoki2010';

data.GSI  = (11.27 - 2.49)/ (30 - 7)/100; units.GSI  = '-'; label.GSI  = 'gonado somatic index'; bibkey.GSI = 'ParkAoki2010';   
temp.GSI = C2K(25);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 comment.GSI = 'computed as (11.27 - 2.49)/ (30 - 7)/100 for 1 day at 2.64 cm';
 
% uni-variate data
% t-L data
data.tL = [ ... % time sing birth (d), standard length (cm)
0.000	0.416
0.000	0.438
0.000	0.438
0.000	0.461
4.702	0.520
4.702	0.557
4.859	0.535
5.016	0.483
9.718	0.610
9.875	0.643
9.875	0.665
9.875	0.688
9.875	0.740
10.031	0.714
10.031	0.762
19.749	0.919
19.749	0.941
19.749	0.952
19.749	1.023
19.906	1.001
20.063	1.064
29.781	1.038
29.781	1.064
29.781	1.112
29.781	1.135
29.781	1.183
29.937	0.960
29.937	1.090
59.718	1.433
60.031	1.456
60.031	1.489
60.031	1.519
99.843	1.532
99.843	1.602
99.843	1.639
99.843	1.662
99.843	1.699
99.843	1.732
100.00	1.758
100.00	1.781
100.00	1.491];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};  
temp.tL    = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GargSaka2004';
comment.tL = 'salinity 17 ppt'; 
  
% t-L data
data.tL_1 = [ ... % time since birth (d), total length (mm)
0.006	5.678
0.236	5.890
0.234	6.102
0.233	6.271
0.353	6.483
1.330	5.975
1.329	6.102
1.327	6.356
2.913	5.975
3.027	6.864
5.946	7.161
5.941	7.712
5.818	7.881
6.181	8.093
6.058	8.347
9.946	9.068
9.945	9.237
10.186	9.492
10.184	9.788
13.956	9.831
14.075	10.212
14.194	10.551
14.192	10.763
14.190	11.017
14.188	11.271
20.990	12.966
21.231	13.220
21.349	13.644
29.128	14.915
29.126	15.169
29.002	15.508
32.050	14.746
32.047	15.169
32.044	15.508
33.984	16.398
35.925	17.203
40.065	16.992
40.063	17.203
40.793	17.203
42.137	16.568
42.254	17.161
43.108	16.864
43.713	17.288
43.950	18.093
46.637	16.907
46.995	17.881
48.816	18.347
49.909	18.686
49.906	19.068
57.206	19.364
57.082	19.576];
data.tL_1(:,2) = data.tL_1(:,2)/10; % convert mm to cm 
units.tL_1 = {'d', 'cm'};  label.tL_1 = {'time since birth', 'total length', 'ad lib food'};  
temp.tL_1  = C2K(26);  units.temp.tL_1 = 'K'; label.temp.tL_1 = 'temperature';
bibkey.tL_1 = 'SakaNoak2000';
comment.tL_1 = 'ad libitum'; 
% restricted food at T = 26 C
data.tL_0 = [ ... % % time sing birth (d), total length (cm)
1.161	0.573
1.163	0.600
1.233	0.658
1.294	0.627
5.080	0.623
5.991	0.767
8.164	0.670
11.133	0.870
12.019	0.721
18.183	0.768
19.096	0.941
28.127	0.740
30.181	0.738
31.982	0.787
36.039	0.958
36.097	0.885
36.939	0.974
36.940	0.989
37.066	0.961
39.056	0.972
47.981	1.028
48.882	1.061
50.106	1.115
50.157	0.964
50.232	1.084
50.233	1.099
51.061	1.033
51.123	1.002
51.897	1.053
51.901	1.091
51.960	1.031];
units.tL_0 = {'d', 'cm'};  label.tL_0 = {'time since birth', 'total length', 'restricted food'};  
temp.tL_0  = C2K(26);  units.temp.tL_0 = 'K'; label.temp.tL_0 = 'temperature';
bibkey.tL_0 = 'SakaNoak2000';
comment.tL_0 = 'restricted food'; 
  
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

%% Group plots
set1 = {'tL_1','tL_0'}; subtitle1 = {'SakaNoak2000 data for ad libitum, restricted food'};
set2 = {'tL'}; subtitle2 = {'Data from GargSaka2004'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Facts
F1 = ['hermaphroditic (above 25 C), with primary males (below 20 C)and secondary males (hermaphrodites that lost female function); ', ...
     'internal self-fertilisation; in presence of males, hermaphrodites lay unfertilised eggs'];
metaData.bibkey.F1 = {'SakaNoak2000', 'Wiki'}; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3RF27'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46566880'; % Ency of Life
metaData.links.id_Wiki = 'Kryptolebias_marmoratus'; % Wikipedia
metaData.links.id_ADW = 'Kryptolebias_marmoratus'; % ADW
metaData.links.id_Taxo = '691145'; % Taxonomicon
metaData.links.id_WoRMS = '314719'; % WoRMS
metaData.links.id_fishbase = 'Kryptolebias-marmoratus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Kryptolebias_marmoratus}}';
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
bibkey = 'GargSaka2004'; type = 'Article'; bib = [ ... 
'author = {Gargeda, M. V. C. and Sakakura, Y. and Hagiwara, A.}, ' ... 
'year = {2004}, ' ...
'title = {Early development of the self-fertilizing mangrove killifish \emph{Rivulus marmoratus} reared in the laboratory}, ' ...
'journal = {Ichthyol Res}, ' ...
'volume = {51}, ' ...
'pages = {309-315}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SakaNoak2000'; type = 'Article'; bib = [ ... 
'author = {Sakakura, Y. and Noakes, D. L. G.}, ' ... 
'year = {2000}, ' ...
'title = {Age, growth, and sexual development in the self-fertilizing hermaphroditic fish \emph{Rivulus marmoratus}}, ' ...
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {59}, ' ...
'pages = {309-317}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ParkAoki2010'; type = 'Article'; bib = [ ... 
'author = {Parka, C.-B. and Jun-ya Aokia, J. and Leec, J.-S. and Nagae, M. and Lee, Y.-D. and Sakakuraf, Y. and Hagiwarab, A. and Soyano, K.}, ' ... 
'year = {2010}, ' ...
'title = {The effects of 17$\beta$-estradiol on various reproductive parameters in the hermaphrodite fish \emph{Kryptolebias marmoratus}}, ' ...
'journal = {Aquatic Toxicology}, ' ...
'volume = {96}, ' ...
'pages = {273-279}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
