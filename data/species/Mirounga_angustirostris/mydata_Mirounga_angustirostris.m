function [data, auxData, metaData, txtData, weights] = mydata_Mirounga_angustirostris

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Phocidae';
metaData.species    = 'Mirounga_angustirostris'; 
metaData.species_en = 'Northern elephant seal'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNE'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bxM', 'xiCic', 'xiCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.1); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 12 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 12 06]; 

%% set data
% zero-variate data

data.tg = 252;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(38.1);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 26;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(38.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1095;   units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38.1);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
%data.tpm = 1826;  units.tpm = 'd';   label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'AnAge';
%  temp.tpm = C2K(38.1);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 13*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'Clin1994';   
  temp.am = C2K(38.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 360;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';  bibkey.Li  = 'Wiki';
  comment.Li = '2.5-3.6 m';
data.Lim  = 500;  units.Lim  = 'cm'; label.Lim  = 'ultimate total length for males';   bibkey.Lim  = 'Wiki';
  comment.Lim = '4 - 5 m';
  
data.Wwb = 37.5e3; units.Wwb = 'g';  label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 140315; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 9.0e5; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'Wiki';
  comment.Wwim = '400 to 900 kg';
data.Wwim = 2.3e6; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'Wiki';
  comment.Wwim = '1500–2300 kg';

data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL_m = [ ... % time since birth (yr), standard length (cm)
0.101	142.958
0.144	144.732
0.145	137.053
0.146	123.466
0.165	163.636
0.167	134.100
0.187	151.232
0.188	148.278
0.189	147.097
0.210	140.009
0.252	153.597
0.253	141.192
0.793	189.063
0.794	180.793
0.795	177.839
0.796	173.114
0.815	192.018
1.747	208.006
1.791	200.919
1.812	210.963
1.813	201.511
1.833	216.871
1.834	215.098
1.835	196.196
1.856	208.011
1.878	208.012
2.787	248.219
2.809	240.540
2.810	229.908
2.811	224.000
2.812	224.000
2.831	236.997
2.853	240.542
2.854	213.960
3.892	273.076
3.893	268.350
3.895	227.000
3.913	303.794
3.914	290.798
3.915	276.621
3.916	268.351
3.936	284.301
3.937	262.445
3.938	258.900
4.956	282.572
4.978	282.573
4.998	312.700
5.018	329.241
5.019	314.473
5.020	307.385
5.021	303.841
5.022	300.887
5.023	294.980
5.106	311.523
5.930	330.461
5.973	343.459
5.974	336.370
5.994	355.865
5.995	341.097
5.996	335.780
5.997	327.510
5.998	323.966
6.016	350.549
6.017	350.549
6.018	348.186
6.019	348.186
6.020	303.883
6.021	291.478
6.039	334.010
6.059	344.644
6.060	342.281
6.061	336.374
6.062	319.243
6.063	316.289
6.082	325.742
6.105	316.291
6.862	360.627
6.928	342.908
6.949	347.635
6.950	338.774
6.970	373.627
6.972	339.957
6.990	412.025
6.992	371.856
7.013	373.039
7.014	367.131
7.015	360.633
7.016	358.861
7.034	378.947
7.035	368.314
7.036	345.867
7.037	342.322
7.038	314.559
7.057	360.045
7.058	355.910
7.078	371.860
7.080	335.235
7.102	338.781
7.123	347.642
7.968	387.847
7.988	400.253
7.989	385.485
7.991	352.405
7.992	339.409
8.011	372.490
8.012	362.448
8.013	353.587
8.032	378.989
8.033	375.444
8.034	364.221
8.055	372.492
8.056	362.450
8.058	325.234
8.075	391.396
8.076	386.079
8.121	350.047
8.944	376.664
8.945	374.301
9.030	397.934
9.031	389.664
9.032	386.119
9.053	375.487
9.055	352.450
9.097	372.536
10.007	400.929
10.028	415.107
10.050	400.930
10.051	389.116
10.052	374.939
10.053	368.441
11.005	405.106
11.028	390.929
11.029	388.567
11.048	396.838
11.049	393.884
11.050	381.479
11.094	373.211
11.960	412.825
11.982	407.510
11.983	393.333
11.984	388.607
11.985	386.244
12.050	354.939
13.002	399.283
13.003	395.739];
data.tL_m(:,1) = data.tL_m(:,1) * 365.25; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'standard length'};  
temp.tL_m    = C2K(38.1);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Clin1994';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL_m = 5 * weights.tL_m;
weights.Wwx = 0 * weights.Wwx;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumes to differ from females by {p_Am} only';
D2 = ['Male {p_Am} jumps upward at puberty, as discussed in Kooy2014 under type A acceleration' ...
    'The male growth curve could fit better if puberty was dealed with as a period, rather than an event'];
D3 = 'In view of low somatic maintenance, k has been targeted to 0.1 and pseudodata for k_J removed';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Facts
F1 = 'largest sex difference among mammals; can dive till 2.133 km ';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'gestation time of 11.5 month include 3-4 month delayed implantation';
metaData.bibkey.F2 = 'AnAge'; 
F3 = 'this entry is used in GoedMelb2018';
metaData.bibkey.F3 = 'GoedMelb2018'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '43MJ6'; % Cat of Life
metaData.links.id_ITIS = '180672'; % ITIS
metaData.links.id_EoL = '46559184'; % Ency of Life
metaData.links.id_Wiki = 'Mirounga_angustirostris'; % Wikipedia
metaData.links.id_ADW = 'Mirounga_angustirostris'; % ADW
metaData.links.id_Taxo = '67496'; % Taxonomicon
metaData.links.id_WoRMS = '255018'; % WoRMS
metaData.links.id_MSW3 = '14001048'; % MSW3
metaData.links.id_AnAge = 'Mirounga_angustirostris'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mirounga_angustirostris}}';
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
bibkey = 'Kooy2014'; type = 'Article'; bib = [ ... 
'author = { S. A. L. M. Kooijman}, ' ... 
'year = {2014}, ' ...
'title = {Metabolic acceleration in animal ontogeny: an evolutionary perspective}, ' ...
'journal = {J. Sea Res.}, ' ...
'volume = {94}, ' ...
'pages = {128--137}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Clin1994'; type = 'incollection'; bib = [ ... 
'doi = {10.1525/9780520328150-011}, ' ...
'author = {Walter L. Clinton}, ' ... 
'year = {1994}, ' ...
'title = {Sexual Selection and Growth in Male Northern Elephant Seals}, ' ...
'booktitle = {Elephant Seals}, ' ...
'editor = {Walter L. Clinton}, ' ...
'publisher = {University of California Press}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Mirounga_angustirostris}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

