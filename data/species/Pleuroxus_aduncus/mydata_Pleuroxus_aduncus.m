function [data, auxData, metaData, txtData, weights] = mydata_Pleuroxus_aduncus

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Chydoridae';
metaData.species    = 'Pleuroxus_aduncus'; 
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'Cfa', 'Cfb', 'Dfa', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'TH', 'TA'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2014 10 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2016 01 10];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2 = [2016 10 15];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 01 15]; 

%% set data
% zero-variate data

data.ab = 3;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'Smir1964';   
  temp.ab = C2K(17);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'derived from instar period';
data.tp = 11;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Smir1964';   
  temp.tp = C2K(17);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 68;     units.am = 'd';    label.am = 'life span';                 bibkey.am = 'Smir1964';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.036; units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'Smir1964';
data.Lp  = 0.05;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'Smir1964';
data.Li  = 0.066; units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'Smir1964';
  
data.Wdi = 2.6;   units.Wdi = 'mug';  label.Wdi = 'ultimate dry weight';     bibkey.Wdi = 'guess';
  comment.Wdi = 'dry weight estimate based on P striatus, corrected for Li';

data.Ri  = 12/(68-11); units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Smir1964';   
  temp.Ri = C2K(17);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% t-L data
data.tL = [ ... % time since birth (d), length (cm)
0.4680	0.0386
1.2193	0.0390
0.4663	0.0392
0.4656	0.0394
0.9170	0.0394
1.2180	0.0394
1.6689	0.0396
1.9690	0.0399
1.4428	0.0397
1.2171	0.0397
0.6147	0.0399
0.9900	0.0402
1.3655	0.0404
1.5906	0.0406
0.4620	0.0406
0.9814	0.0430
1.4321	0.0433
1.5815	0.0436
0.9033	0.0440
0.5284	0.0436
0.5273	0.0439
1.5043	0.0443
1.8811	0.0441
2.7061	0.0450
3.0039	0.0460
3.9820	0.0460
4.5836	0.0461
4.1340	0.0455
3.4575	0.0453
4.0599	0.0451
4.2121	0.0445
4.1278	0.0476
4.1262	0.0481
4.2001	0.0485
3.0681	0.0497
3.0665	0.0502
5.0233	0.0500
5.2503	0.0496
6.9797	0.0499
7.8823	0.0500
5.1678	0.0520
5.1660	0.0526
6.2200	0.0524
6.1430	0.0530
6.1412	0.0535
7.7229	0.0530
10.1243	0.0550
11.1030	0.0548
5.1556	0.0560
3.7232	0.0570
6.2043	0.0576
7.2591	0.0571
4.2406	0.0601
5.4430	0.0605
5.8232	0.0592
5.5203	0.0599
6.1974	0.0599
6.4240	0.0596
6.5753	0.0593
6.9506	0.0596
7.0248	0.0600
7.0978	0.0607
6.5714	0.0606
6.1958	0.0604
6.2691	0.0611
5.2923	0.0606
7.7796	0.0592
8.0810	0.0590
8.3803	0.0595
8.7561	0.0597
9.2071	0.0598
8.9055	0.0600
8.3786	0.0601
8.0024	0.0601
7.5514	0.0600
7.3239	0.0605
8.0013	0.0605
8.4525	0.0606
8.0752	0.0609
10.0355	0.0595
7.9354	0.0574
11.9955	0.0583
16.8101	0.0585
11.0889	0.0595
11.3889	0.0598
11.6907	0.0596
11.6892	0.0601
11.9151	0.0600
12.2893	0.0607
12.1388	0.0607
12.1377	0.0610
11.6109	0.0611
11.0829	0.0615
11.0096	0.0609
11.0860	0.0605
10.9368	0.0601
10.4852	0.0601
10.4839	0.0606
10.1075	0.0606
10.1075	0.0606
9.7333	0.0600
12.8947	0.0595
13.4212	0.0596
14.0231	0.0596
14.4738	0.0598
14.2477	0.0599
14.2466	0.0603
14.6980	0.0603
14.3964	0.0605
14.0200	0.0606
13.4933	0.0606
13.7927	0.0611
13.1913	0.0610
13.2632	0.0621
12.8783	0.0649
11.8248	0.0650
11.1486	0.0647
8.8904	0.0651
15.0722	0.0610
15.6732	0.0613
15.7495	0.0609
15.7513	0.0603
15.6774	0.0599
15.1501	0.0601
15.1512	0.0597
14.9188	0.0619
15.0629	0.0641
15.0600	0.0650
15.9601	0.0659
16.1823	0.0671
17.0135	0.0659
17.9944	0.0650
17.9913	0.0660
19.2714	0.0657
17.0234	0.0626
17.0256	0.0619
16.7274	0.0610
16.8807	0.0600
17.2569	0.0600
17.1799	0.0606
17.1084	0.0594
17.8603	0.0595
17.8590	0.0600
18.4609	0.0600
19.0610	0.0606
19.3633	0.0601
18.2332	0.0606
17.9311	0.0610
18.3044	0.0620
18.2276	0.0625
18.0008	0.0628
18.9813	0.0620
20.1924	0.0596
20.1159	0.0601
20.0375	0.0611
20.1112	0.0616
20.1105	0.0618
20.1094	0.0622
19.9581	0.0625
19.9570	0.0629
19.8049	0.0634
21.0191	0.0599
21.0928	0.0604
21.1667	0.0609
21.1623	0.0624
21.3114	0.0628
20.9326	0.0637
20.9306	0.0643
20.9286	0.0650
21.9757	0.0671
22.8009	0.0679
21.9671	0.0699
22.2105	0.0641
21.9888	0.0627
21.9912	0.0619
22.0693	0.0610
22.0707	0.0605
22.0724	0.0599
22.5982	0.0602
23.1266	0.0596
22.0736	0.0596
23.9538	0.0598
23.9511	0.0607
23.9500	0.0611
24.5548	0.0601
24.9254	0.0619
24.9237	0.0625
24.9206	0.0636
24.0961	0.0625
24.0945	0.0630
24.1682	0.0636
24.0910	0.0642
23.9372	0.0653
22.9589	0.0654
22.9615	0.0645
22.9633	0.0639
23.0423	0.0627
26.2792	0.0621
26.2821	0.0611
26.0600	0.0600
25.9759	0.0629
25.9737	0.0636
24.9923	0.0647
25.0662	0.0652
25.0651	0.0656
25.1383	0.0662
24.9770	0.0698
27.0081	0.0699
28.0608	0.0701
27.9116	0.0697
28.0701	0.0671
27.0913	0.0673
25.7422	0.0656
26.0453	0.0648
28.0006	0.0651
27.0272	0.0636
27.0292	0.0629
27.0363	0.0606
27.0372	0.0603
27.0385	0.0598
29.2214	0.0595
29.2197	0.0601
29.1431	0.0605
28.0079	0.0627
28.9847	0.0632
30.0388	0.0629
30.7916	0.0627
30.7899	0.0633
31.0138	0.0639
30.7115	0.0644
30.7087	0.0653
29.8817	0.0651
29.8793	0.0659
29.1329	0.0639
29.0559	0.0645
29.0543	0.0650
29.0521	0.0657
29.0497	0.0665
29.0488	0.0668
29.0475	0.0673
29.0459	0.0678
29.0448	0.0682
29.2648	0.0701
30.0171	0.0701
31.0689	0.0706
31.1474	0.0695
32.9573	0.0681
36.1883	0.0696
36.1863	0.0702
36.1097	0.0707
36.5625	0.0702
32.0622	0.0655
32.0636	0.0651
32.0658	0.0644
32.8909	0.0652
32.8929	0.0645
33.1200	0.0641
33.6460	0.0643
34.3242	0.0639
34.1724	0.0644
34.0952	0.0650
32.0698	0.0630
32.0729	0.0620
33.1229	0.0631
34.0259	0.0631
35.2301	0.0629
35.2328	0.0620
34.4090	0.0608
34.4112	0.0600
33.3574	0.0602
32.7547	0.0605
32.0014	0.0608
32.0786	0.0601
35.9916	0.0599
35.9898	0.0605
37.3456	0.0600
38.0978	0.0601
39.1508	0.0602
38.0918	0.0621
38.0893	0.0629
36.1323	0.0631
35.9801	0.0637
36.0529	0.0645
36.0509	0.0652
39.1962	0.0701
37.2580	0.0641
38.0825	0.0651
39.2150	0.0638
39.2179	0.0629
40.0479	0.0621
39.9767	0.0607
39.9784	0.0602
39.9804	0.0595
40.7310	0.0601
41.1014	0.0620
41.0915	0.0653
41.6778	0.0705
43.9354	0.0704
46.1925	0.0704
46.1945	0.0697
47.9240	0.0700
48.6002	0.0703
43.1169	0.0673
42.8230	0.0650
42.8252	0.0642
42.9025	0.0636
42.9799	0.0628
42.0107	0.0599
42.8376	0.0601
45.0967	0.0595
45.0947	0.0601
45.1635	0.0623
43.9507	0.0653
46.0548	0.0661
47.4122	0.0651
47.2766	0.0601
49.3080	0.0602
50.2108	0.0602
50.9499	0.0646
52.2271	0.0652
53.9606	0.0642
55.9918	0.0643
56.2215	0.0629
54.0481	0.0601
58.9087	0.0700
61.3158	0.0702
62.8967	0.0699
66.2066	0.0701
68.5396	0.0699];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL    = C2K(17);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL  = 'Smir1964';
comment.tL = 'Temp: 14 - 20 C';


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


%% Facts
F1 = 'during a life span of 68 d, 17 moults and 6 broods occur with 12 young';
metaData.bibkey.F1 = 'Smir1964'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4KFC3'; % Cat of Life
metaData.links.id_ITIS = '84053'; % ITIS
metaData.links.id_EoL = '46498245'; % Ency of Life
metaData.links.id_Wiki = 'Chydoridae'; % Wikipedia
metaData.links.id_ADW = 'Pleuroxus_aduncus'; % ADW
metaData.links.id_Taxo = '156250'; % Taxonomicon
metaData.links.id_WoRMS = '148397'; % WoRMS


%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Smir1964'; type = 'Article'; bib = [ ... 
'author = {Smirnov, N. N.}, ' ... 
'year = {1964}, ' ...
'title = {\emph{Pleuroxus} ({C}hydoridae): {F}ield observations and growth.}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {23}, ' ...
'pages = {305--320}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
