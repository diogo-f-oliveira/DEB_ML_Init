function [data, auxData, metaData, txtData, weights] = mydata_Pleuroxus_striatus

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Chydoridae';
metaData.species    = 'Pleuroxus_striatus'; 
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'Cfa', 'Cfb', 'Dfa', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'TH'};
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
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 01 15]; 

%% set data
% zero-variate data

data.ab = 2;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'Smir1964';   
  temp.ab = C2K(17);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'derived from instar period';
data.tp = 12;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Smir1964';   
  temp.tp = C2K(17);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 77;     units.am = 'd';    label.am = 'life span';                 bibkey.am = 'Smir1964';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.044; units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'Smir1964';
data.Lp  = 0.065; units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'Smir1964';
data.Li  = 0.090; units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'Smir1964';
  
data.Wdi = 6.6;   units.Wdi = 'mug';  label.Wdi = 'ultimate dry weight';     bibkey.Wdi = 'guess';
  comment.Wdi = 'from CulvBouc85 for Chydorus sphaericus: W in mug = 14.0793 * (L in mm)^1.9796';

data.Ri  = 20/(77-12); units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Smir1964';   
  temp.Ri = C2K(17);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% t-L data
data.tL = [ ... % time since birth (d), length (cm)
0.5266	0.0441
0.7497	0.0450
0.5979	0.0455
0.5966	0.0459
0.8968	0.0461
1.4239	0.0460
0.9738	0.0455
1.5768	0.0452
1.2770	0.0448
1.0526	0.0444
1.1170	0.0480
0.9599	0.0502
3.0632	0.0513
3.0610	0.0520
4.0379	0.0524
3.6606	0.0528
5.2397	0.0531
5.2342	0.0549
3.5037	0.0549
3.9534	0.0555
4.0271	0.0560
2.9693	0.0575
2.5172	0.0577
3.1185	0.0579
6.0553	0.0571
6.1140	0.0626
5.9617	0.0632
5.1343	0.0631
7.2436	0.0622
7.2412	0.0631
7.9938	0.0630
8.8216	0.0629
10.1001	0.0631
11.0032	0.0630
13.4108	0.0630
10.5449	0.0653
9.5673	0.0651
5.8057	0.0650
7.7605	0.0655
7.9880	0.0649
12.1231	0.0659
12.1952	0.0669
9.7151	0.0660
10.6910	0.0668
9.7877	0.0669
9.9362	0.0676
7.9050	0.0675
7.8271	0.0684
7.9760	0.0689
7.9747	0.0693
7.9729	0.0699
8.0464	0.0705
5.8692	0.0689
6.0163	0.0700
6.0141	0.0708
6.3106	0.0722
7.8910	0.0721
8.5688	0.0719
9.8472	0.0721
10.2999	0.0717
11.0512	0.0721
10.8315	0.0701
12.1105	0.0701
15.7282	0.0680
14.8904	0.0714
14.9637	0.0720
17.1522	0.0698
17.9045	0.0698
18.8074	0.0698
19.1891	0.0680
21.0704	0.0679
22.1981	0.0682
23.9294	0.0679
22.0359	0.0721
20.7569	0.0721
8.9359	0.0749
9.9133	0.0751
11.0432	0.0747
11.6455	0.0746
11.9474	0.0743
11.9456	0.0749
12.0195	0.0753
12.6229	0.0748
12.4709	0.0753
12.9263	0.0740
13.0000	0.0745
13.0735	0.0751
13.0724	0.0755
13.0728	0.0753
13.8289	0.0741
13.7519	0.0747
14.0513	0.0752
14.3547	0.0744
14.4286	0.0748
14.8820	0.0742
14.8807	0.0746
14.8794	0.0750
14.8783	0.0754
15.4067	0.0748
15.4053	0.0753
16.0083	0.0749
16.0068	0.0754
15.4835	0.0743
16.0101	0.0743
16.6127	0.0741
16.4600	0.0748
16.5330	0.0756
16.9136	0.0741
16.9121	0.0746
16.9107	0.0751
16.9094	0.0755
17.4376	0.0750
17.8917	0.0741
17.8906	0.0745
17.8888	0.0751
17.8877	0.0754
18.2663	0.0746
18.8693	0.0743
18.8675	0.0749
18.8658	0.0754
19.0842	0.0779
19.0755	0.0807
19.4701	0.0746
19.9224	0.0743
19.9206	0.0749
19.9191	0.0755
20.5232	0.0747
20.5966	0.0753
21.0505	0.0745
20.8987	0.0749
20.8215	0.0756
21.0478	0.0754
20.8938	0.0766
20.9651	0.0779
20.9633	0.0785
21.5006	0.0750
21.8765	0.0750
22.2525	0.0751
21.9502	0.0755
22.4802	0.0744
25.9544	0.0701
26.9267	0.0720
23.3822	0.0747
22.9307	0.0747
22.9294	0.0752
22.9283	0.0756
22.7756	0.0763
24.1263	0.0775
24.0498	0.0779
24.0451	0.0795
23.7424	0.0801
25.7742	0.0799
25.9096	0.0849
24.2118	0.0741
23.8347	0.0744
23.9077	0.0751
23.9818	0.0755
24.4344	0.0751
25.1133	0.0745
24.9617	0.0749
24.9601	0.0754
25.5647	0.0745
26.0179	0.0740
25.7886	0.0751
25.7873	0.0756
26.3153	0.0751
26.9149	0.0759
28.0439	0.0757
27.5197	0.0749
26.8421	0.0751
26.8432	0.0747
28.7998	0.0746
28.8740	0.0749
28.8722	0.0755
27.8901	0.0768
27.8129	0.0775
27.9572	0.0796
27.9552	0.0802
28.8678	0.0770
29.0165	0.0776
28.8649	0.0780
29.6956	0.0769
29.4006	0.0749
30.0025	0.0749
30.0047	0.0742
30.9806	0.0750
31.8832	0.0750
33.0878	0.0748
32.7847	0.0755
28.7834	0.0800
28.9319	0.0807
30.0644	0.0794
29.9126	0.0798
29.9109	0.0804
30.3634	0.0800
30.7433	0.0788
30.8168	0.0794
30.8155	0.0798
30.8137	0.0804
31.0312	0.0831
31.6446	0.0793
31.7174	0.0801
31.7161	0.0806
31.7869	0.0820
32.8484	0.0793
32.4704	0.0799
33.0719	0.0801
32.6942	0.0806
33.2215	0.0804
33.8231	0.0804
32.6891	0.0823
32.9114	0.0834
33.6753	0.0795
33.9800	0.0783
33.7557	0.0779
34.2077	0.0776
33.9146	0.0751
35.8711	0.0749
33.9838	0.0770
36.0187	0.0759
36.0143	0.0774
35.7060	0.0798
35.7047	0.0802
35.7036	0.0806
34.8778	0.0800
34.6432	0.0829
35.6965	0.0830
35.6912	0.0847
34.7118	0.0852
37.7312	0.0819
40.3612	0.0830
42.1642	0.0839
41.9345	0.0852
43.2135	0.0852
44.4932	0.0850
45.1696	0.0852
44.4241	0.0829
42.7685	0.0831
41.7933	0.0821
42.6961	0.0821
37.2114	0.0796
36.9844	0.0800
37.9638	0.0796
37.9620	0.0802
37.9603	0.0808
38.3378	0.0803
38.8635	0.0806
38.8646	0.0803
38.6411	0.0795
39.2419	0.0799
39.2397	0.0806
39.8445	0.0797
39.9177	0.0803
39.6894	0.0812
40.2935	0.0805
40.9701	0.0806
40.9719	0.0800
40.9735	0.0795
37.4509	0.0750
38.2010	0.0758
38.5049	0.0748
40.0846	0.0749
40.1576	0.0756
40.9115	0.0751
41.2879	0.0750
42.7918	0.0754
43.0949	0.0746
44.1440	0.0760
44.3684	0.0765
44.8990	0.0751
40.9775	0.0782
42.7811	0.0789
42.6291	0.0794
42.3268	0.0798
43.1538	0.0801
42.8513	0.0806
42.0989	0.0806
43.9811	0.0801
45.0344	0.0802
45.9402	0.0792
45.9373	0.0802
45.7786	0.0829
45.6261	0.0835
47.1329	0.0829
46.9802	0.0836
47.2017	0.0850
48.9173	0.0900
49.0087	0.0846
48.7122	0.0831
47.7372	0.0821
48.0439	0.0802
47.8959	0.0794
49.9270	0.0795
49.9252	0.0801
49.9184	0.0823
49.9166	0.0829
49.5404	0.0829
49.9903	0.0834
50.8168	0.0838
50.9692	0.0832
52.0221	0.0833
52.0261	0.0820
52.7776	0.0823
52.8599	0.0799
50.9095	0.0780
51.8967	0.0750
34.9077	0.0701
38.0676	0.0701
40.3243	0.0702
45.0646	0.0701
46.9455	0.0702
54.0754	0.0760
57.2347	0.0763
57.0039	0.0780
59.1196	0.0750
62.1277	0.0754
54.5155	0.0798
53.9123	0.0802
55.1126	0.0814
54.7339	0.0822
54.8063	0.0832
56.2358	0.0832
55.9291	0.0851
57.1235	0.0882
57.0425	0.0901
57.8160	0.0831
59.0200	0.0831
60.0733	0.0831
58.0510	0.0800
58.9538	0.0801
58.9523	0.0806
63.9196	0.0800
62.0296	0.0830
63.0829	0.0830
64.0610	0.0830
65.9424	0.0829
61.7902	0.0876
66.8237	0.0901
68.8551	0.0901
71.1270	0.0852
73.9165	0.0833
77.0105	0.0802];
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
F1 = 'during a life span of 77 d, 18 moults and 11 broods occur with 20 young';
metaData.bibkey.F1 = 'Smir1964'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4HQMX'; % Cat of Life
metaData.links.id_ITIS = '684648'; % ITIS
metaData.links.id_EoL = '1041337'; % Ency of Life
metaData.links.id_Wiki = 'Chydoridae'; % Wikipedia
metaData.links.id_ADW = 'Pleuroxus_striatus'; % ADW
metaData.links.id_Taxo = '536179'; % Taxonomicon
metaData.links.id_WoRMS = '1303105'; % WoRMS

%% References
bibkey = 'UNH'; type = 'Misc'; bib = ...
'howpublished = {\url{http://cfb.unh.edu/cfbkey/html/Organisms/CCladocera/FChydoridae/GPleuroxus/Pleuroxus_striatus/pleuroxusstriatus.html}}';
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
bibkey = 'Smir1964'; type = 'Article'; bib = [ ... 
'author = {Smirnov, N. N.}, ' ... 
'year = {1964}, ' ...
'title = {\emph{Pleuroxus} ({C}hydoridae): {F}ield observations and growth.}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {23}, ' ...
'pages = {305--320}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
