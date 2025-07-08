function [data, auxData, metaData, txtData, weights] = mydata_Vipera_latastei
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Viperidae';
metaData.species    = 'Vipera_latastei'; 
metaData.species_en = 'Lataste''s viper'; 

metaData.ecoCode.climate = {'BSk', 'Csa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iThh', '0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv', 'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 09];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 09];

%% set data
% zero-variate data

data.am = 14*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'BritRebe2003';   
  temp.am = C2K(24); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 16;    units.Lb  = 'cm';  label.Lb  = 'total length at birth';      bibkey.Lb  = 'BritRebe2003';  
data.Lp  = 35;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';      bibkey.Lp  = 'BritRebe2003';  
data.Li  = 58;    units.Li  = 'cm';  label.Li  = 'ultimate SVL';  bibkey.Li  = 'BritRebe2003';
  comment.Li = 'Wiki: TL 72 cm';

data.Wwi = 196;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Vipera berus: 180*(72/70)^3';
  
data.Ri  = 13/365/3;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(24);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 till 13 eggs per clutch, 1 clutch each 3 yr';

% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), SVL (cm)
0.030	15.952
1.013	17.857
1.996	25.357
1.996	23.452
3.024	27.024
4.022	32.738
4.022	30.833
4.022	29.881
5.019	34.405
5.019	33.690
5.050	35.119
6.002	39.048
6.002	37.024
6.985	40.000
7.000	38.929
7.998	42.619
8.996	43.214
11.006	46.071
12.004	47.024
13.002	47.500
13.985	49.048
14.000	47.976];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'SVL', 'female'};  
temp.tL_f   = C2K(24);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'BritRebe2003';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), SVL (cm)
0.998	20.833
0.999	19.881
1.013	18.690
1.965	23.929
1.981	26.429
1.982	21.429
2.978	26.429
3.024	28.929
3.025	28.095
3.991	27.976
4.006	35.952
4.007	35.238
4.008	34.405
5.004	41.190
5.005	40.357
5.006	39.881
5.007	39.048
5.018	41.905
5.019	37.976
5.957	43.095
5.972	45.000
5.973	40.833
6.985	47.143
8.981	48.333
9.948	49.881
9.963	48.929
10.991	50.000
10.992	49.405
11.022	51.190];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'SVL', 'male'};  
temp.tL_m   = C2K(24);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'BritRebe2003';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for femles, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are supposed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '5BJ98'; % Cat of Life
metaData.links.id_ITIS = '634994'; % ITIS
metaData.links.id_EoL = '289374'; % Ency of Life
metaData.links.id_Wiki = 'Vipera_latastei'; % Wikipedia
metaData.links.id_ADW = 'Vipera_latastei'; % ADW
metaData.links.id_Taxo = '646326'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Vipera&species=latastei'; % ReptileDB
metaData.links.id_AnAge = 'Vipera_latastei'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Vipera_latastei}}';
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
bibkey = 'BritRebe2003'; type = 'Article'; bib = [ ... 
'author = {J. C. Brito and R. Rebelo}, ' ... 
'year = {2003}, ' ...
'title = {Differential Growth and Mortality Affect Sexual Size Dimorphism in \emph{Vipera latastei}}, ' ...
'journal = {Copeia}, ' ...
'volume = {2003}, ' ...
'pages = {865-871}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

