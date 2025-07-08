function [data, auxData, metaData, txtData, weights] = mydata_Pagellus_affinis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Pagellus_affinis'; 
metaData.species_en = 'Arabian pandora'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIW'};
metaData.ecoCode.habitat = {'0iMp','jiMc'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 12 10];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 10];

%% set data
% zero-variate data

data.ab = 6.5;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'guess';   
  temp.ab = C2K(25); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Diplodus puntazzo';
data.am = 10*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'AlKi2013';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 21.4;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase';  
data.Li  = 42.1;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.85 mm of Diplodes sargus: pi/6*0.085^3';
data.Wwp = 189.6;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based in 0.01820*Lp^3.02, see F1';
data.Wwi = 1453;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based in 0.01820*Li^3.02, see F1';

data.GSI  = 0.045; units.GSI  = '-'; label.GSI  = 'gonado-somatic index'; bibkey.GSI = 'AlKi2013';   
  temp.GSI = C2K(25); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.871	13.887
0.883	14.732
0.943	11.606
1.047	16.338
1.116	20.310
1.128	21.155
1.271	16.676
1.271	16.000
1.284	14.056
1.471	17.521
1.483	16.423
1.494	18.197
1.577	18.197
1.778	17.859
1.837	17.183
1.872	16.592
1.873	16.000
1.883	18.366
1.885	14.479
1.908	15.493
2.000	21.831
2.001	20.056
2.036	19.296
2.048	20.225
2.083	21.070
2.107	19.042
2.117	23.437
2.119	18.366
2.128	25.127
2.142	20.056
2.214	18.620
2.319	21.493
2.330	22.338
2.354	20.141
2.402	19.296
2.413	20.901
2.426	17.690
2.449	20.141
2.555	18.789
2.625	21.239
2.754	22.676
2.780	16.423
2.789	23.521
2.815	19.296
2.815	17.690
2.850	20.225
2.851	17.775
2.864	15.155
2.873	20.817
2.875	16.930
2.876	14.310
2.887	15.746
2.898	18.535
2.909	19.127
2.944	19.887
2.966	24.789
2.990	22.930
2.991	21.915
3.001	25.211
3.013	24.366
3.038	20.901
3.084	23.268
3.086	20.056
3.097	21.831
3.098	18.028
3.109	19.549
3.119	23.944
3.132	22.592
3.132	21.408
3.156	20.563
3.189	26.225
3.203	21.915
3.226	22.761
3.227	21.070
3.238	23.521
3.285	23.944
3.308	24.704
3.321	22.169
3.321	21.239
3.321	20.732
3.332	23.352
3.415	23.099
3.415	21.493
3.427	22.338
3.498	20.817
3.522	20.056
3.592	23.099
3.604	22.169
3.616	21.493
3.747	18.282
3.759	17.859
3.803	24.197
3.815	24.958
3.815	23.606
3.817	19.211
3.829	19.887
3.840	21.324
3.865	17.859
3.925	15.915
3.933	23.268
3.956	25.380
3.978	28.845
3.979	26.310
3.981	23.352
3.993	22.676
4.003	27.155
4.004	24.197
4.040	22.845
4.049	28.000
4.050	27.577
4.051	25.380
4.062	26.732
4.063	24.620
4.063	23.859
4.108	28.761
4.109	27.155
4.111	22.254
4.111	21.155
4.132	26.901
4.156	26.141
4.157	23.944
4.181	22.423
4.191	28.930
4.192	24.958
4.203	28.085
4.204	25.634
4.204	23.859
4.215	26.901
4.217	22.845
4.262	26.394
4.310	24.366
4.322	24.958
4.335	22.761
4.345	25.634
4.393	25.127
4.499	23.268
4.665	21.915
4.768	28.930
4.769	27.408
4.817	24.789
4.829	23.944
4.899	25.887
4.934	28.085
4.982	26.225
4.993	27.577
5.003	32.817
5.004	29.944
5.017	25.465
5.040	28.845
5.042	24.197
5.052	27.070
5.088	26.479
5.088	24.873
5.089	23.437
5.098	31.380
5.110	29.859
5.111	28.000
5.124	25.549
5.157	30.197
5.169	29.183
5.183	24.113
5.227	31.887
5.264	28.169
5.287	30.535
5.311	29.099
5.312	25.549
5.714	23.606
5.759	29.944
5.759	28.676
5.759	28.254
5.783	27.662
5.784	25.634
5.794	29.437
5.796	25.634
5.829	30.535
5.948	28.085
5.959	29.944
5.972	26.986
5.982	31.718
6.006	30.197
6.017	32.732
6.019	28.761
6.064	33.408
6.067	26.563
6.075	34.676
6.078	28.338
6.089	30.113
6.101	28.930
6.102	25.380
6.147	31.887
6.183	31.211
6.300	31.803
6.677	32.986
6.679	28.845
6.690	31.465
6.690	30.535
6.704	24.282
6.819	32.479
6.891	29.437
6.902	32.225
6.983	35.521
6.984	33.577
7.054	35.014
7.076	39.493
7.089	36.197
7.091	30.535
7.101	33.746
7.102	33.239
7.103	29.606
7.114	32.732
7.115	30.535
7.337	34.676
7.763	29.944
7.776	26.817
8.008	36.451
8.045	33.070
8.068	34.761
8.092	34.169
9.082	35.859];
data.tL_f(:,1) = (0.5+data.tL_f(:,1)) * 365; % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-1;end;end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth','fork length','females'};  
temp.tL_f    = C2K(25);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'AlKi2013'; 
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.900	14.414
1.092	19.369
1.092	16.667
1.116	16.036
1.164	21.982
1.309	17.928
1.525	18.559
1.777	16.396
1.789	19.369
1.873	15.045
1.885	18.829
1.885	17.838
1.885	16.577
1.909	15.946
1.993	23.604
2.017	22.072
2.041	20.000
2.065	20.721
2.077	21.351
2.101	19.009
2.101	20.000
2.185	19.369
2.317	18.108
2.329	20.000
2.365	20.360
2.401	21.441
2.401	20.541
2.449	18.468
2.485	19.640
2.497	21.171
2.497	17.928
2.521	18.919
2.581	21.892
2.605	20.270
2.641	21.351
2.641	18.378
2.749	17.477
2.773	22.523
2.797	21.261
2.809	19.369
2.809	18.919
2.809	17.297
2.821	18.288
2.821	23.514
2.869	19.730
2.869	16.396
2.869	15.225
2.893	18.829
2.905	18.108
2.905	15.766
2.905	14.505
2.965	24.775
2.965	24.234
2.977	22.613
2.989	26.036
3.001	23.423
3.001	20.631
3.013	21.892
3.061	25.495
3.061	22.793
3.061	21.261
3.133	20.000
3.133	18.739
3.145	20.901
3.157	23.514
3.157	22.162
3.193	25.315
3.217	24.144
3.229	24.595
3.229	20.450
3.253	23.063
3.277	22.432
3.301	21.622
3.301	24.955
3.349	22.523
3.373	19.910
3.373	24.144
3.397	21.802
3.409	21.171
3.409	22.883
3.469	23.423
3.493	18.829
3.493	22.252
3.505	19.099
3.505	19.730
3.505	20.991
3.589	22.703
3.637	21.982
3.697	19.820
3.782	24.505
3.806	19.279
3.806	19.009
3.818	23.333
3.830	22.523
3.830	19.820
3.842	21.622
3.854	21.081
3.866	22.342
3.878	15.586
3.914	16.216
3.950	24.054
3.986	28.288
3.998	27.117
3.998	25.225
4.022	26.396
4.022	22.252
4.034	23.514
4.082	28.559
4.082	27.928
4.094	27.117
4.094	24.234
4.106	26.396
4.106	23.333
4.118	24.775
4.118	21.351
4.142	22.613
4.166	27.568
4.178	25.315
4.178	23.423
4.178	21.532
4.226	28.919
4.238	22.342
4.250	27.297
4.250	24.595
4.274	26.216
4.286	21.892
4.298	28.739
4.322	26.486
4.382	23.964
4.406	24.505
4.406	27.568
4.466	23.243
4.634	23.874
4.646	24.865
4.658	23.063
4.694	20.991
4.706	21.712
4.754	26.216
4.790	27.568
4.790	22.703
4.814	24.955
4.874	26.396
4.946	25.766
4.958	27.387
4.970	29.820
4.970	29.550
4.994	26.486
5.006	31.441
5.018	30.180
5.018	25.225
5.030	28.108
5.042	31.982
5.054	26.486
5.066	22.342
5.078	28.829
5.090	23.874
5.102	32.523
5.102	29.459
5.114	25.766
5.126	31.081
5.126	22.883
5.138	28.198
5.138	24.595
5.150	28.108
5.174	30.450
5.198	31.892
5.210	31.532
5.246	25.495
5.270	28.468
5.294	30.000
5.318	26.306
5.510	27.658
5.666	25.856
5.690	28.739
5.726	29.730
5.738	25.225
5.774	30.450
5.774	27.027
5.786	29.279
5.798	28.288
5.810	26.396
5.810	24.955
5.858	27.297
5.918	31.622
5.954	25.766
5.990	32.793
5.990	31.622
5.990	28.559
6.002	29.550
6.014	27.928
6.026	30.360
6.062	27.658
6.074	35.315
6.074	34.595
6.074	32.162
6.074	31.081
6.086	28.649
6.110	32.793
6.122	25.766
6.146	29.820
6.182	31.892
6.303	31.802
6.327	29.189
6.687	27.748
6.699	29.820
6.699	25.405
6.771	30.811
6.819	27.748
6.867	34.324
6.867	33.694
6.879	32.973
7.011	34.234
7.071	31.532
7.071	33.063
7.095	32.342
7.119	33.694
7.119	34.414
7.119	35.405
7.131	36.847
7.671	32.973
7.695	30.450
7.803	32.523
8.067	31.982
8.091	35.045
8.091	34.144
8.115	35.856
8.127	32.883
8.788	35.225
8.836	33.514
9.112	36.577];
data.tL_m(:,1) = (0.5+data.tL_m(:,1)) * 365; % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-1;end;end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth','fork length','males'};  
temp.tL_m    = C2K(25);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'AlKi2013'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.01820*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4BZB8'; % Cat of Life
metaData.links.id_ITIS = '647958'; % ITIS
metaData.links.id_EoL = '46579967'; % Ency of Life
metaData.links.id_Wiki = 'Pagellus_affinis'; % Wikipedia
metaData.links.id_ADW = 'Pagellus_affinis'; % ADW
metaData.links.id_Taxo = '182484'; % Taxonomicon
metaData.links.id_WoRMS = '218609'; % WoRMS
metaData.links.id_fishbase = 'Pagellus-affinis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pagellus_affinis}}';
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
bibkey = 'AlKi2013'; type = 'phdthesis'; bib = [ ... 
'howpublished = {\url{https://figshare.com/articles/thesis/Biology_and_fisheries_assessment_of_the_Arabian_pandora_pagellus_affinis_Boulenger_1887_in_the_Arabian_Sea_Sultanate_of_Oman/23207012/1}}, ' ...
'author = {Fatma Rahid Hilal Al-Kiyumi}, ' ... 
'year = {2013}, ' ...
'title = {BIOLOGY AND FISHERIES ASSESSMENT OF THE ARABIAN PANDORA (\emph{Pagellus affinis}) (Boulenger, 1887) IN THE ARABIAN SEA, SULTANATE OF OMAN}, ' ...
'school = {University of Tasmania}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Pagellus-affinis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
