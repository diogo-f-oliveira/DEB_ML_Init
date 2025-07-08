function [data, auxData, metaData, txtData, weights] = mydata_Gekko_hokouensis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Gekkonidae';
metaData.species    = 'Gekko_hokouensis'; 
metaData.species_en = 'Hokou gecko'; 

metaData.ecoCode.climate = {'Cwa', 'Cfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTa', '0iTd'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 06 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 08];

%% set data
% zero-variate data

data.am = 9*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(24); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Heteronotia_binoei';

data.Lb  = 2.22;  units.Lb  = 'cm';  label.Lb  = 'SVL at birth'; bibkey.Lb  = 'OkadIzaw2002';  
data.Lp  = 4.3;   units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females'; bibkey.Lp  = 'OkadIzaw2002';  
data.Li  = 5.19;   units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';  bibkey.Li  = 'OkadIzaw2002';  
data.Lim  = 5.05;   units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';  bibkey.Lim  = 'OkadIzaw2002';  

data.Wwi = 3.5;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'guess';
  comment.Wwi = 'based on size-corrected value for Heteronotia_binoei: (5.2/5)^3*3.1';

data.Ri  = 2.2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'OkadIzaw2002';   
  temp.Ri = C2K(24);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 eggs per clutch, 1, sometimes 2, clutches each 1  yr';

% univariate data
% time -  length data
data.tL_f = [ ... % time (yr), SVL (cm)
0.053	2.771
0.108	2.452
0.178	3.115
0.201	3.204
0.296	3.510
0.316	2.911
0.332	3.522
0.370	2.962
0.440	3.535
0.465	3.280
0.579	3.318
0.687	3.369
0.691	3.828
0.727	3.930
0.765	3.255
0.828	4.274
0.840	4.274
0.858	4.287
0.870	4.389
0.870	4.338
0.875	4.478
0.901	3.917
0.901	3.866
0.919	3.943
0.930	4.312
0.947	4.580
0.949	3.968
0.967	4.045
0.978	4.439
0.990	4.389
1.008	4.452
1.009	4.045
1.027	4.121
1.049	4.669
1.062	4.350
1.068	4.261
1.075	3.955
1.099	4.096
1.122	4.223
1.159	4.045
1.165	4.019
1.175	4.758
1.188	4.248
1.205	4.745
1.254	4.185
1.302	4.248
1.315	4.006
1.380	4.325
1.420	4.873
1.524	4.299
1.553	4.758
1.566	4.299
1.667	4.490
1.704	4.299
1.716	4.465
1.750	4.847
1.761	5.153
1.794	4.439
1.829	4.771
1.851	5.166
1.876	5.051
1.877	4.669
1.882	4.962
2.021	4.682
2.045	4.732
2.393	4.771
2.429	4.694
2.579	4.758
2.776	4.860
2.812	4.975
2.841	5.153];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'SVL', 'female'};  
temp.tL_f   = C2K(24);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'OkadIzaw2002';
comment.tL_f = 'data for females; temperature ranges from 16 to 27 C';
%
data.tL_m = [ ... % time (yr), SVL (cm)
0.198	2.806
0.204	2.677
0.210	2.613
0.216	3.026
0.252	3.103
0.270	3.116
0.324	3.000
0.330	3.310
0.342	2.742
0.384	2.742
0.432	2.639
0.468	3.361
0.492	2.639
0.510	3.232
0.576	3.477
0.612	3.516
0.618	3.361
0.624	3.116
0.654	3.671
0.654	3.852
0.702	3.774
0.708	2.910
0.714	3.181
0.738	3.955
0.756	3.206
0.780	3.465
0.804	3.439
0.804	3.890
0.810	3.658
0.810	3.723
0.846	3.645
0.852	3.619
0.852	3.774
0.864	4.200
0.876	4.084
0.888	4.135
0.936	4.484
0.942	3.516
0.972	4.097
0.990	4.316
0.990	3.994
0.990	3.890
1.014	4.135
1.020	3.903
1.044	3.529
1.068	4.548
1.092	4.394
1.140	4.290
1.140	3.632
1.176	3.826
1.182	3.671
1.188	4.755
1.188	4.548
1.188	4.084
1.206	3.748
1.254	4.290
1.254	3.865
1.260	4.781
1.260	3.761
1.260	3.761
1.344	4.187
1.350	4.510
1.410	4.497
1.536	4.110
1.548	4.406
1.572	4.703
1.608	4.897
1.638	4.419
1.650	4.561
1.698	4.084
1.818	4.587
1.848	5.000
1.872	4.690
1.884	4.910
1.944	4.961
1.944	4.690
2.076	4.832
2.082	5.000
2.118	4.613
2.148	4.548
2.148	4.716
2.364	4.832
2.436	4.600
2.460	4.755
2.484	4.832
2.598	4.703
2.748	4.561
2.868	5.013
2.868	4.690
2.868	4.806
2.958	4.794];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'SVL', 'male'};  
temp.tL_m   = C2K(24);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'OkadIzaw2002';
comment.tL_m = 'data for males; temperature ranges from 16 to 27 C';

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '3FH5M'; % Cat of Life
metaData.links.id_ITIS = '818567'; % ITIS
metaData.links.id_EoL = '794400'; % Ency of Life
metaData.links.id_Wiki = 'Gekko_hokouensis'; % Wikipedia
metaData.links.id_ADW = 'Gekko_hokouensis'; % ADW
metaData.links.id_Taxo = '641486'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Gekko&species=hokouensis'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gekko_hokouensis}}';
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
bibkey = 'OkadIzaw2002'; type = 'Article'; bib = [ ... 
'author = {Shigeru Okada and Masako Izawa and Hidetoshi Ota}, ' ... 
'year = {2002}, ' ...
'title = {Growth and Reproduction of \emph{Gekko hokouensis} ({R}eptilia: {S}quamata) on {O}kinawajima {I}sland of the {R}yukyu {A}rchipelago, {J}apan}, ' ...
'pages = {473-479}, ' ...
'volume = {36(3)}, ' ...
'journal = {Journal of Herpetology}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
