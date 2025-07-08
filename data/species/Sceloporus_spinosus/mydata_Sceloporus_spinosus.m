function [data, auxData, metaData, txtData, weights] = mydata_Sceloporus_spinosus
%% set metaData
metaData.phylum     = 'Chordata';
metaData.class      = 'Reptilia';
metaData.order      = 'Squamata';
metaData.family     = 'Phrynosomatidae';
metaData.species    = 'Sceloporus_spinosus';
metaData.species_en = 'Eastern spiny lizard';

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf','0iTh'};
metaData.ecoCode.embryo  = {'Tns'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'L-dL'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 02 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 02 07];

%% set data
% zero-variate data;
data.ab = 26;  units.ab = 'd';      label.ab = 'age at birth';             bibkey.ab = 'guess';
temp.ab = C2K(25); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 6*365;     units.am = 'd'; label.am = 'life span';               bibkey.am = 'guess';
temp.am = C2K(14);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 3.25;  units.Lb  = 'cm';  label.Lb  = 'SVL ate birth';   bibkey.Lb  = 'guess';
data.Lp  = 8.0; units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';   bibkey.Lp  = 'BarrSali2020';
data.Li  = 10.8; units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'BarrSali2020';

data.Wwi = 48.54; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'EoL';

data.Ri  = 11/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(22.7);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '11 eggs per clutch, 1 clutch per yr';

% uni-variate data
% length-change in length
data.LdL_f = [... % SVL (cm), change in SVL (cm/d)
4.26394	0.02144
4.80449	0.01937
5.19987	0.02060
6.96918	0.01411
7.25418	0.01599
7.63340	0.02755
8.00717	0.01749
8.20428	0.01740
9.47438	0.00329
9.67342	0.00555
9.85581	0.00254
10.3019	0.00555];
units.LdL_f  = {'cm', 'cm/d'};  label.LdL_f = {'SVL', 'change in SVL', 'females'};  
temp.LdL_f = C2K(21); units.temp.LdL_f = 'K'; label.temp.LdL_f = 'temperature';
bibkey.LdL_f = 'BarrSali2020'; comment.LdL_f = 'temp 16-26 C';
%
data.LdL_m = [... % SVL (cm), change in SVL (cm/d)
4.23954	0.01364
4.29278	0.01551
4.58555	0.01847
4.62548	0.02042
4.65209	0.01864
4.86502	0.01975
5.73004	0.02322
7.42015	0.01737
7.92586	0.00415
7.95247	0.01754
9.30989	0.00678
9.33650	0.00178
9.46958	0.00500
9.60266	0.00364
9.82890	0.00153
9.86882	0.00042
9.86882	0.00466
10.0551	0.00127
10.2148	0.00212];
units.LdL_m  = {'cm', 'cm/d'};  label.LdL_m = {'SVL', 'change in SVL', 'males'};  
temp.LdL_m = C2K(21); units.temp.LdL_m = 'K'; label.temp.LdL_m = 'temperature';
bibkey.LdL_m = 'BarrSali2020'; comment.LdL_m = 'temp 16-26 C';

%% set weights for all real data
weights = setweights(data, []);
weights.LdL_f = 3 * weights.LdL_f;
weights.LdL_m = 3 * weights.LdL_m;
weights.Lb = 5 * weights.Lb;
weights.Lp = 5 * weights.Lp;
weights.Li = 5 * weights.Li;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LdL_f','LdL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Temperatures are guessed; in tL data it (in C) is supposed to vary as 25*sin(2*pi*(t+t_0)/36';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '4V5C6'; % Cat of Life
metaData.links.id_ITIS = '586072'; % ITIS
metaData.links.id_EoL = '790705'; % Ency of Life
metaData.links.id_Wiki = 'Sceloporus_spinosus'; % Wikipedia
metaData.links.id_ADW = 'Sceloporus_spinosus'; % ADW
metaData.links.id_Taxo = '573982'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Sceloporus&species=spinosus'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sceloporus_spinosus}}';   
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
bibkey = 'BarrSali2020'; type = 'article'; bib = [ ...  
'author = {Carlos A. Torres Barrag\''{a}n and Uriel Hern''{a}ndez Salinas and Aurelio Ramírez-Bautista}, ' ...
'title = {Do growth rate and survival differ between undisturbed and disturbed environments for \emph{Sceloporus spinosus} {W}iegmann, 1828 ({S}quamata: {P}hrynosomatidae) from {O}axaca, {M}exico?}, ' ...
'journal = {Amphibian \& Reptile Conservation}, ' ...
'pages = {43–54 (e222)}, ' ...
'volume = {14(1)}, ' ...
'year = {2020}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/790705}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

