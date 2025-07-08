function [data, auxData, metaData, txtData, weights] = mydata_Rhinochimaera_pacifica

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Chimaeriformes'; 
metaData.family     = 'Rhinochimaeridae';
metaData.species    = 'Rhinochimaera_pacifica'; 
metaData.species_en = 'Pacific spookfish'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MP'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7.1); % K, body temp
metaData.data_0     = {'am'; 'ap'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2021 07 27];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 07 27]; 

%% set data
% zero-variate data;
data.tp = 21*365; units.tp = 'd';    label.tp = 'time since birth at puberty for females';  bibkey.tp = 'Bell2012';   
  temp.tp = C2K(7.1); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 16*365; units.tpm = 'd';    label.tpm = 'time since birth at puberty for males';  bibkey.tpm = 'Bell2012';   
  temp.tpm = C2K(7.1); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 30*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'Wiki';   
  temp.am = C2K(7.1); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 13;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'guess';
  comment.Lb = 'based on Hydrolagus_colliei '; 
data.Lp  = 84.8;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'Bell2012';
data.Lpm  = 68.8;   units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'Bell2012';
data.Li  = 165;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwi = 22.5e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00245*Li^3.14, see F1';

data.Ri  = 10/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Bell2012';   
  temp.Ri = C2K(7.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'enlarged ovarian oocytes at TL 80 cm';

% uni-variate data at f
data.tL_f = [ ... % time since birth (yr), pre-supra caudal fin length (cm)
5.739	67.926
7.915	73.208
7.919	68.683
8.888	79.930
9.659	53.633
10.779	63.964
10.848	72.104
10.861	55.814
11.760	59.373
12.879	71.061
12.958	66.531
13.019	85.532
14.078	77.315
14.080	74.147
14.843	59.163
14.904	78.616
14.906	75.901
14.912	67.304
15.880	80.360
15.883	76.287
15.960	73.115
16.860	77.126
16.863	73.053
16.865	70.338
16.868	65.813
17.847	64.389
17.911	78.412
18.809	84.234
18.817	73.826
18.819	71.563
18.888	79.251
19.786	85.525
19.863	82.352
19.940	80.084
19.943	76.464
20.693	79.128
20.770	75.956
20.772	73.693
20.787	54.235
21.972	77.684
22.796	81.248
22.806	68.125
23.025	76.708
23.772	83.897
26.852	87.308
27.900	93.571
28.881	88.527
30.914	84.769];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(7.1); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Bell2012';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), pre-supra caudal fin length (cm)
6.068	44.662
9.074	70.581
9.981	49.029
10.038	71.000
12.023	54.349
12.079	66.903
12.079	73.181
12.930	69.120
13.043	55.664
13.157	73.149
14.121	69.085
14.121	68.188
14.972	74.440
15.028	68.609
15.028	70.403
15.992	64.544
16.049	67.233
16.049	69.475
17.013	72.586
17.013	69.895
17.013	68.101
17.070	53.750
18.034	60.447
18.147	71.655
18.147	74.345
18.941	65.353
18.941	70.734
19.055	54.139
19.849	68.016
20.132	72.492
20.813	73.369];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(7.1); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Bell2012';
comment.tL_m = 'data for males';

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
D1 = 'Males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00245*(TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '78TNC'; % Cat of Life
metaData.links.id_ITIS = '564482'; % ITIS
metaData.links.id_EoL = '46561150'; % Ency of Life
metaData.links.id_Wiki = 'Rhinochimaera_pacifica'; % Wikipedia
metaData.links.id_ADW = 'Rhinochimaera_pacifica'; % ADW
metaData.links.id_Taxo = '185991'; % Taxonomicon
metaData.links.id_WoRMS = '271420'; % WoRMS
metaData.links.id_fishbase = 'Rhinochimaera-pacifica'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rhinochimaera_pacifica}}'; 
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
bibkey = 'Bell2012'; type = 'phdthesis'; bib = [ ... 
'author = {Justin David Bell}, ' ...
'year = {2012}, ' ...
'title  = {Reproduction and ageing of Australian holocephalans and white-fin swell shark}, ' ...
'school = {Deakin University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Rhinochimaera-pacifica.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

