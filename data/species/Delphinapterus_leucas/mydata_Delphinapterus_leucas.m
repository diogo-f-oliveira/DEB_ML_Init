function [data, auxData, metaData, txtData, weights] = mydata_Delphinapterus_leucas

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Monodontidae';
metaData.species    = 'Delphinapterus_leucas'; 
metaData.species_en = 'Beluga'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MN'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCik'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'; 't-Le'}; 

metaData.COMPLETE = 2.9; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm   = [2017 01 04];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2023 08 13];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 08 13];  

%% set data
% zero-variate data

data.tg = 416;     units.tg = 'd';    label.tg = 'gestation time';           bibkey.tg =  'AnAge';   
  temp.tg = C2K(35.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'Body temp from Monodon, see HeidNiel2014';
data.tx = 679;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(35.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1644;    units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(35.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 2283;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(35.5);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 60*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'Suyd2009';   
  temp.am = C2K(35.5);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'Data for female, males live shorter';

data.Lb  = 130;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Suyd2009';
data.Li  = 370;   units.Li  = 'cm';  label.Li  = 'ultimate total length for female';   bibkey.Li  = 'Suyd2009';
data.Lim  = 440;   units.Lim  = 'cm';  label.Lim  = 'ultimate total length for male';   bibkey.Lim  = 'Suyd2009';

data.Wwb = 60e3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'AnAge';
data.Wwi = 950e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight females'; bibkey.Wwi = 'Wiki';
  comment.Wwi = 'calculated as (370/440)^3 * 1600 kg';
data.Wwim = 1600e3; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight males'; bibkey.Wwim = 'Wiki';
  
data.Ri  = 0.3/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = {'AnAge'};   
  temp.Ri = C2K(35.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 calf each 0.3 yr';
  
% uni-variate data
% time-length
data.tL_fCS = [ % time since birth (yr), standard length (cm)
1.872	208.618
1.872	231.274
2.902	253.163
2.995	280.508
3.931	238.332
3.931	246.145
3.931	264.895
4.867	281.313
5.897	325.858
6.833	319.620
6.833	304.776
6.833	300.089
6.833	278.995
7.863	321.196
7.863	290.727
8.799	332.927
8.892	257.147
8.892	311.835
9.735	318.877
9.922	335.285
9.922	331.379
9.922	325.129
10.858	309.516
10.858	336.079
10.858	341.548
10.952	360.299
11.888	356.405
11.888	323.592
11.888	318.905
11.981	272.031
11.981	333.750
12.824	331.417
12.824	337.667
13.011	340.794
13.853	304.087
14.041	331.433
14.041	325.183
14.977	306.445
14.977	336.133
14.977	344.726
14.977	358.789
15.070	325.977
15.819	337.706
15.913	382.238
15.913	333.801
16.006	346.302
16.006	325.990
16.006	325.208
16.755	333.812
16.849	338.501
16.942	353.346
17.878	359.608
17.878	346.327
19.002	341.654
19.844	342.446
19.844	334.633
19.844	329.165
19.844	317.446
19.938	367.447
20.780	353.396
20.967	365.898
20.967	344.023
21.903	310.441
21.997	337.005
21.997	334.661
21.997	347.943
22.839	326.079
22.933	344.049
22.933	351.861
23.027	335.456
23.027	370.612
23.963	383.906
23.963	374.531
23.963	321.406
24.805	331.573
24.899	364.387
24.899	379.230
24.992	347.200
24.992	351.888
25.928	344.088
25.928	349.556
26.958	369.882
27.051	351.915
27.800	378.487
27.894	350.363
27.988	410.521
27.988	356.614
28.830	355.063
29.953	384.765
29.953	334.765
31.919	348.072
31.919	354.322
31.919	369.166
31.919	374.634
31.919	380.103
32.949	334.023
33.885	394.191
33.978	324.661
33.978	355.130
33.978	377.786
35.008	370.768
35.944	369.999
36.973	391.888
36.973	363.763
40.062	363.803
40.062	334.115
40.998	369.284
41.841	356.014
41.934	347.421
43.058	356.029
43.058	363.842
43.900	388.072
46.895	356.079
47.925	394.374
48.955	370.950
54.852	375.714
57.005	344.492]; 
data.tL_fCS(:,1) = data.tL_fCS(:,1) * 365; % convert yr to d
units.tL_fCS  = {'d', 'cm'};  label.tL_fCS = {'time since birth', 'standard length', 'female'};  
temp.tL_fCS  = C2K(35.5);  units.temp.tL_fCS = 'K'; label.temp.tL_fCS = 'temperature';
bibkey.tL_fCS = 'Suyd2009';
comment.tL_fCS = 'Data for females in eastern Chukchi Sea';
% 
data.tL_mCS = [ ... % time since birth (yr), standard length (cm)
1.778	266.429
1.778	310.179
3.744	255.518
3.838	283.644
7.956	300.885
8.050	286.042
8.892	326.678
10.952	318.893
10.952	321.236
10.952	326.705
11.888	368.124
11.981	408.750
12.730	348.603
12.824	365.792
13.853	364.243
13.853	344.712
13.853	314.243
13.947	353.307
13.947	350.963
14.977	353.320
14.977	378.320
16.849	358.813
16.849	362.719
16.849	367.407
16.849	376.001
17.878	418.983
17.878	425.233
17.972	375.234
18.814	375.245
19.002	361.966
19.844	397.915
20.967	401.054
20.967	418.242
21.061	447.149
21.903	387.785
22.746	401.077
22.933	416.705
22.933	397.174
23.963	406.562
24.899	454.230
24.992	409.700
24.992	419.857
24.992	423.763
24.992	430.013
24.992	440.169
25.835	434.711
25.928	404.244
26.022	422.995
26.115	412.840
26.958	463.632
26.958	405.820
27.894	426.144
27.894	433.176
28.081	397.241
28.081	403.491
30.047	394.141
30.047	405.079
30.047	414.454
32.949	422.304
34.072	443.412
35.008	427.800
36.037	425.469
37.910	412.212
39.126	418.478
39.126	428.634
39.782	425.518
41.841	434.139
41.841	438.826
41.934	400.546
42.964	419.309
43.900	413.072
44.930	425.585
45.866	417.003]; 
data.tL_mCS(:,1) = data.tL_mCS(:,1) * 365; % convert yr to d
units.tL_mCS  = {'d', 'cm'};  label.tL_mCS = {'time since birth', 'standard length', 'male'};  
temp.tL_mCS  = C2K(35.5);  units.temp.tL_mCS = 'K'; label.temp.tL_mCS = 'temperature';
bibkey.tL_mCS = 'Suyd2009';
comment.tL_mCS = 'Data for males in eastern Chukchi Sea';
%
data.tL_fKS = [ % time since birth (yr), standard length (cm)
0.995	189.579
0.995	188.027
2.000	201.996
3.877	245.455
3.879	239.246
3.881	235.366
5.879	292.018
5.881	287.361
5.893	254.767
7.892	307.539
7.897	295.898
7.901	285.033
8.034	264.080
9.916	295.898
9.930	254.767
11.911	360.310
11.915	350.222
11.924	323.836
11.931	304.435
13.823	307.539
13.933	351.774
13.938	338.581
13.940	333.925
13.942	328.492
13.944	321.508
13.946	316.851
17.971	352.550
17.985	312.195
18.981	350.998
18.982	348.670
19.990	353.326
22.006	358.758
22.008	354.102
22.011	347.118
23.900	357.982
24.913	346.341
25.041	340.909
25.928	330.820
26.796	375.055
28.696	354.878
29.833	350.222
30.083	357.206
30.845	343.237
30.847	338.581
31.845	369.623
31.848	361.086
32.108	338.581
33.869	354.878
38.794	345.565
39.042	355.654
39.052	330.044
39.927	352.550
40.932	363.415
43.960	366.519
44.977	344.789
45.857	352.550
47.873	360.310
48.887	349.446
53.928	366.519
54.059	354.102
60.977	413.858]; 
data.tL_fKS(:,1) = data.tL_fKS(:,1) * 365; % convert yr to d
units.tL_fKS  = {'d', 'cm'};  label.tL_fKS = {'time since birth', 'standard length', 'female'};  
temp.tL_fKS  = C2K(35.5);  units.temp.tL_fKS = 'K'; label.temp.tL_fKS = 'temperature';
bibkey.tL_fKS = 'Suyd2009';
comment.tL_fKS = 'Data for females in Kotzebue Sound';
% 
data.tL_mKS = [ ... % time since birth (yr), standard length (cm)
0.870	187.251
1.852	263.304
1.997	209.756
4.006	236.918
6.895	273.392
7.654	270.288
10.924	297.450
11.804	308.315
11.928	313.747
13.810	342.461
15.825	354.102
15.829	344.013
15.949	360.310
17.850	337.029
17.974	344.789
17.975	340.909
19.870	335.477
19.875	319.956
21.771	310.643
25.675	333.925
32.984	360.310
33.483	375.055
34.869	381.264
34.983	416.186
37.764	402.217
40.652	441.796
40.670	390.576
41.805	392.905
41.919	425.499
41.922	419.290
42.919	452.661
43.059	413.082
47.732	401.441
50.752	426.275
53.901	441.796
60.850	416.186
60.971	431.707
63.873	430.155
70.939	430.931
73.978	403.769
74.725	431.707]; 
data.tL_mKS(:,1) = data.tL_mKS(:,1) * 365; % convert yr to d
units.tL_mKS  = {'d', 'cm'};  label.tL_mKS = {'time since birth', 'standard length', 'male'};  
temp.tL_mKS  = C2K(35.5);  units.temp.tL_mKS = 'K'; label.temp.tL_mKS = 'temperature';
bibkey.tL_mKS = 'Suyd2009';
comment.tL_mKS = 'Data for males in Kotzebue Sound';
%
data.tL_fCI = [ % time since birth (yr), standard length (cm)
0.187	166.333
1.994	241.000
16.012	344.444
16.947	350.667
17.009	368.556
19.128	360.000
20.062	350.667
21.059	319.556
21.059	396.556
21.931	356.889
22.056	377.111
22.056	363.111
22.991	353.000
22.991	367.778
22.991	375.556
28.100	369.333
29.097	359.222]; 
data.tL_fCI(:,1) = data.tL_fCI(:,1) * 365; % convert yr to d
units.tL_fCI  = {'d', 'cm'};  label.tL_fCI = {'time since birth', 'standard length', 'female'};  
temp.tL_fCI  = C2K(35.5);  units.temp.tL_fCI = 'K'; label.temp.tL_fCI = 'temperature';
bibkey.tL_fCI = 'Suyd2009';
comment.tL_fCI = 'Data for females in Cook Inlet';
% 
data.tL_mCI = [ ... % time since birth (yr), standard length (cm)
7.913	314.111
7.975	367.000
9.969	342.111
10.031	335.111
10.903	355.333
14.019	367.778
15.888	398.111
16.885	391.111
17.944	456.444
18.006	367.000
18.006	372.444
18.006	377.889
18.006	407.444
18.006	412.889
19.003	419.889
19.003	450.222
20.000	421.444
20.935	474.333
21.931	446.333
23.053	408.222
25.047	422.222
25.109	451.778
28.100	429.222
31.028	437.778
31.963	432.333
32.960	359.222
33.022	449.444
35.078	412.889]; 
data.tL_mCI(:,1) = data.tL_mCI(:,1) * 365; % convert yr to d
units.tL_mCI  = {'d', 'cm'};  label.tL_mCI = {'time since birth', 'standard length', 'male'};  
temp.tL_mCI  = C2K(35.5);  units.temp.tL_mCI = 'K'; label.temp.tL_mCI = 'temperature';
bibkey.tL_mCI = 'Suyd2009';
comment.tL_mCI = 'Data for males in Cook Inlet';
%
data.tL_fBB = [ % time since birth (yr), standard length (cm)
4.008	232.230
4.010	241.605
8.003	277.721
9.996	277.810
11.994	302.899
12.995	326.381
15.985	327.296
19.977	356.380
23.073	321.362]; 
data.tL_fBB(:,1) = data.tL_fBB(:,1) * 365; % convert yr to d
units.tL_fBB  = {'d', 'cm'};  label.tL_fBB = {'time since birth', 'standard length', 'female'};  
temp.tL_fBB  = C2K(35.5);  units.temp.tL_fBB = 'K'; label.temp.tL_fBB = 'temperature';
bibkey.tL_fBB = 'Suyd2009';
comment.tL_fBB = 'Data for females in Bristol Bay';
% 
data.tL_mBB = [ ... % time since birth (yr), standard length (cm)
0.005	160.174
0.005	133.614
0.007	143.770
0.952	168.031
8.006	299.596
14.995	367.095
17.934	393.008
19.038	371.963
19.040	383.682
23.030	399.485
24.022	369.842
31.950	421.759]; 
data.tL_mBB(:,1) = data.tL_mBB(:,1) * 365; % convert yr to d
units.tL_mBB  = {'d', 'cm'};  label.tL_mBB = {'time since birth', 'standard length', 'male'};  
temp.tL_mBB  = C2K(35.5);  units.temp.tL_mBB = 'K'; label.temp.tL_mBB = 'temperature';
bibkey.tL_mBB = 'Suyd2009';
comment.tL_mBB = 'Data for males in Bristol Bay';

% time-length for foetus 
data.tLe = [ ... % time since may 1 (d), length (cm)
73.205	16.100
103.126	17.509
105.199	22.085
105.788	30.775
135.690	33.556
164.703	48.684
416.334	150.066
422.298	131.781
425.979	123.554
436.346	146.433
439.028	158.326
466.098	159.732
469.597	164.310];
units.tLe  = {'d', 'cm'};  label.tLe = {'time since may 1', 'length'};  
temp.tLe  = C2K(35.5);  units.temp.tLe = 'K'; label.temp.tLe = 'temperature';
bibkey.tLe = 'Laws1959';
comment.tLe = 'Data from St Lawrence and Hudson Bay';

%% set weights for all real data
weights = setweights(data, []);
weights.Lb = weights.Lb * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_fCS','tL_mCS'}; subtitle1 = {'Data for females, males in eastern Chukchi Sea'};
set2 = {'tL_fKS','tL_mKS'}; subtitle2 = {'Data for females, males in Kotzebue Sound'};
set3 = {'tL_fCI','tL_mCI'}; subtitle3 = {'Data for females, males in Cook Inlet'};
set4 = {'tL_fBB','tL_mBB'}; subtitle4 = {'Data for females, males in Bristol Bay'};
metaData.grp.sets = {set1,set2,set3,set4};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
D3 = 'mod_2: tLe adata added';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '34HXS'; % Cat of Life
metaData.links.id_ITIS = '180483'; % ITIS
metaData.links.id_EoL = '46559337'; % Ency of Life
metaData.links.id_Wiki = 'Delphinapterus_leucas'; % Wikipedia
metaData.links.id_ADW = 'Delphinapterus_leucas'; % ADW
metaData.links.id_Taxo = '68811'; % Taxonomicon
metaData.links.id_WoRMS = '137115'; % WoRMS
metaData.links.id_MSW3 = '14300105'; % MSW3
metaData.links.id_AnAge = 'Delphinapterus_leucas'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Delphinapterus_leucas}}';
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
bibkey = 'HeidNiel2014'; type = 'Article'; bib = [ ... 
'author = {Heide-Jorgensen, M. P. and Nielsen, N. H. and Hansen, R. G. and Blackwell, S. B.}, ' ... 
'year = {2014}, ' ...
'title = {Stomach temperature of narwhals (\emph{Monodon monoceros}) during feeding events}, ' ...
'journal = {Animal Biotelemetry}, ' ...
'volume = {2}, ' ...
'pages = {9}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Suyd2009'; type = 'Phdthesis'; bib = [ ... 
'author = {Suydam, R. S.}, ' ... 
'year = {2009}, ' ...
'title = {Stomach temperature of narwhals (\emph{Monodon monoceros}) during feeding events}, ' ...
'school = {University of Washington graduate school}, ' ...
'howpublished = {\url{https://alaskafisheries.noaa.gov/sites/default/files/suydam_dissertation2009.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Delphinapterus_leucas}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Delphinapterus_leucas/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Laws1959'; type = 'techreport'; bib = [ ... 
'author = {Laws, R. M.}, ' ... 
'year = {1959}, ' ...
'title = {The foetal growth rates of whales with special reference to the fin whale, \emph{Balaenoptera physalus} {L}inn}, ' ...
'institution = {Nat. Inst of Oceanography}, ' ...
'volume = {29}, ' ...
'pages = {281-308}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

