  function [data, auxData, metaData, txtData, weights] = mydata_Coilia_brachygnathus
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Engraulidae';
metaData.species    = 'Coilia_brachygnathus'; 
metaData.species_en = 'Yangtse grenadier anchovy'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFr','0iFl'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 05 06];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 06];

%% set data
% zero-variate data
data.ab = 9; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(17.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 4*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'QinWang2018';   
  temp.am = C2K(17.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 17.21;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'YimeCao2023';
data.Li = 35.4;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.7e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 17;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','YimeCao2023'};
  comment.Wwp = 'based on 0.00275*Lp^3.07, see F1';
data.Wwi = 156.6;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00275*Li^3.07, see F1';

data.Ri  = 6e4/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';  
  temp.Ri = C2K(17.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Coilia_borneensis: 2558*156.6/6.91';

% uni-variate data
% time-length
data.tL = [ ... % time since hatch (yr), total length (cm)
0.231	11.328
0.231	9.526
0.236	10.285
0.236	9.858
0.236	9.242
0.241	11.043
0.246	10.759
0.311	10.899
0.331	10.566
0.416	11.559
0.421	11.369
0.491	10.893
0.506	11.129
0.655	11.740
0.665	12.072
0.745	12.117
0.810	12.731
0.820	12.351
0.895	13.060
0.900	13.439
0.900	12.301
0.905	12.775
0.910	13.249
0.984	17.656
0.984	14.147
0.989	17.039
0.989	14.574
0.990	13.768
0.994	15.569
0.995	13.389
1.000	12.867
1.055	12.438
1.059	17.369
1.060	11.206
1.063	18.601
1.064	16.278
1.065	13.434
1.069	15.756
1.069	15.188
1.074	16.799
1.074	14.571
1.074	14.144
1.074	13.765
1.075	13.054
1.079	17.700
1.143	18.599
1.144	16.655
1.144	14.711
1.145	12.056
1.149	16.133
1.158	18.124
1.159	14.189
1.159	13.952
1.160	12.245
1.163	17.792
1.164	17.460
1.164	13.573
1.165	13.098
1.169	17.033
1.169	15.658
1.169	15.042
1.169	14.426
1.233	17.884
1.234	16.273
1.234	14.708
1.238	18.216
1.239	16.889
1.239	15.514
1.239	15.182
1.239	14.376
1.243	19.780
1.243	17.600
1.243	17.268
1.244	16.651
1.248	18.690
1.308	17.218
1.313	18.545
1.314	16.033
1.315	11.813
1.318	17.929
1.318	17.123
1.319	16.127
1.319	15.606
1.319	14.847
1.324	14.610
1.334	15.179
1.403	18.495
1.403	18.068
1.403	17.547
1.403	17.073
1.404	14.987
1.404	14.039
1.408	17.831
1.408	16.693
1.409	15.650
1.409	15.366
1.409	14.560
1.409	12.190
1.413	20.012
1.413	19.016
1.413	18.353
1.414	16.077
1.418	16.409
1.424	12.711
1.469	14.985
1.479	16.075
1.484	15.648
1.484	15.221
1.484	13.989
1.488	17.781
1.488	16.691
1.489	12.708
1.493	17.402
1.494	14.605
1.494	14.083
1.898	18.289
1.898	16.962
1.898	16.440
1.903	17.720
1.903	17.246
1.903	16.677
1.903	15.824
1.908	14.638
1.909	11.936
1.913	15.207
1.923	15.538
1.976	26.298
1.977	21.463
1.977	20.135
1.978	18.286
1.978	17.955
1.978	16.817
1.981	23.074
1.982	20.325
1.987	19.851
1.987	19.471
1.988	18.191
1.991	25.729
1.991	23.406
1.991	22.647
1.992	18.950
1.993	17.148
2.006	24.449
2.056	24.968
2.057	21.745
2.061	23.878
2.061	23.167
2.062	21.365
2.062	21.223
2.062	19.184
2.063	15.676
2.066	25.869
2.066	24.304
2.067	20.796
2.068	17.714
2.071	22.266
2.072	20.322
2.072	19.658
2.072	18.662
2.073	17.193
2.076	25.537
2.076	22.929
2.076	22.597
2.082	18.093
2.142	19.656
2.152	20.224
2.157	18.754
2.157	17.664
2.158	17.427
2.162	18.470
2.167	19.133
2.172	20.650
2.227	18.515
2.232	21.454
2.232	19.036
2.232	18.752
2.236	24.393
2.236	22.687
2.237	21.075
2.238	15.907
2.242	17.377
2.310	26.619
2.312	20.124
2.312	18.939
2.312	18.655
2.316	25.386
2.316	23.680
2.316	22.779
2.316	22.257
2.321	22.447
2.321	21.404
2.322	21.025
2.322	20.598
2.322	19.839
2.322	19.555
2.322	19.223
2.322	18.133
2.336	21.783
2.385	26.522
2.400	25.147
2.401	22.729
2.401	21.970
2.406	24.767
2.406	23.345
2.406	22.491
2.406	22.349
2.406	22.065
2.406	21.686
2.406	21.117
2.406	20.927
2.407	19.931
2.407	19.552
2.407	19.268
2.407	18.794
2.407	17.751
2.410	25.573
2.411	20.737
2.412	20.263
2.412	18.556
2.420	26.094
2.481	21.778
2.487	19.075
2.487	18.696
2.490	26.187
2.490	25.712
2.491	22.062
2.491	20.592
2.492	20.213
2.492	19.929
2.495	27.751
2.495	25.333
2.501	21.113
2.560	25.758
2.560	25.189
2.560	25.141
2.561	23.719
2.570	26.089
2.571	21.822
2.580	26.847
2.580	26.421
2.580	24.809
2.900	26.410
2.900	26.410
2.900	25.177
2.901	21.954
2.901	21.811
2.902	18.256
2.905	23.850
2.906	22.475
2.906	21.432
2.906	20.958
2.907	17.734
2.907	17.213
2.910	23.186
2.911	20.673
2.911	19.251
2.915	24.703
2.915	24.229
2.921	20.199
2.921	19.488
2.979	28.161
3.000	26.359
3.049	28.064
3.059	29.486
3.064	30.766
3.069	30.055
3.069	28.443
3.144	28.156
3.394	27.721
3.404	27.341
3.494	28.713
3.569	24.397
3.573	28.758
3.579	27.715
3.889	28.292
3.903	29.885
3.903	27.628
3.904	26.699
3.904	25.836
3.904	25.106
3.910	30.748];
data.tL(:,1) = (data.tL(:,1)+0.5) * 365; % convert yr to d
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1); data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(17.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = {'QinWang2018'};

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 3;
weights.ab = weights.ab * 0;
weights.Wwb = weights.Wwb * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00275*(TL in cm)^3.07'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = 0.84*TL';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'WWFW'; % Cat of Life
metaData.links.id_ITIS = '551433'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Coilia_brachygnathus'; % Wikipedia
metaData.links.id_ADW = 'Coilia_brachygnathus'; % ADW
metaData.links.id_Taxo = '171562'; % Taxonomicon
metaData.links.id_WoRMS = '279077'; % WoRMS
metaData.links.id_fishbase = 'Coilia_brachygnathus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Coilia_brachygnathus}}';  
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
bibkey = 'QinWang2018'; type = 'Article'; bib = [ ... 
'doi = {10.1051/alr/2017040}, ' ...
'author = {Xiangchao Qin and Teng Wang and Pengcheng Lin and Xue Wang and Huanzhang Liu}, ' ...
'year = {2018}, ' ...
'title = {Age, growth, mortality and movement patterns of shortjaw tapertail anchovy, \emph{Coilia brachygnathus}, in the channel connecting {D}ongting {L}ake and the {Y}angtze {R}iver in central {C}hina}, ' ... 
'journal = {Aquat. Living Resour.}, ' ...
'volume = {31(3)}, '...
'pages = {312-325}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'YimeCao2023'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jfb.15337 }, ' ...
'author = {Melaku Abelneh Yimer and Liang Cao and Jiang-Zhong Shen and E Zhang}, ' ...
'year = {2023}, ' ...
'title = {Age, growth, maturity and mortality of the tapetail anchovy \emph{Coilia brachygnathus} ({E}ngraulidae) in {L}ake {H}onghu, {C}hina}, ' ... 
'journal = {Fish Biol.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Coilia-brachygnathus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  