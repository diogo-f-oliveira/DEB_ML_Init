function [data, auxData, metaData, txtData, weights] = mydata_Sphyrna_zygaena

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Sphyrnidae';
metaData.species    = 'Sphyrna_zygaena'; 
metaData.species_en = 'Smooth hammerhead shark'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCic', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2018 07 23];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];

%% set data
% zero-variate data;
data.ab = 10.5*30.5;     units.ab = 'd';      label.ab = 'age at birth';                 bibkey.ab = 'fishbase';    
  temp.ab = C2K(26.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 21*365;  units.am = 'd';      label.am = 'life span';                          bibkey.am = 'fishbase';   
  temp.am = C2K(26.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 42.3;     units.Lb  = 'cm';    label.Lb  = 'fork length at birth';            bibkey.Lb  = {'fishbase','KohlCase1996'};
  comment.Lb = 'fishbase TL = 55 cm; KohlCase1996: FL = 0.7756 TL -0.3132';
data.Lp_f  = 213;  units.Lp_f  = 'cm';  label.Lp_f  = 'fork length at puberty (female)'; bibkey.Lp_f  = {'fishbase','KohlCase1996'};
  comment.Lp_f = 'fishbase TL = 275 cm; KohlCase1996: FL = 0.7756 TL -0.3132';
data.Li_f  = 387;  units.Li_f  = 'cm';  label.Li_f  = 'ultimate fork length (female)';   bibkey.Li_f  = 'Wiki';
  comment.Li_f = 'fishbase TL = 500 cm; KohlCase1996: FL = 0.7756 TL -0.3132';

data.Wwp_f = 66.7e3; units.Wwp_f = 'g';   label.Wwp_f = 'wet weight at puberty (female)';bibkey.Wwp_f = 'fishbase';
  comment.Wwp_f = 'based on (Lp_f/Li_f)^3*Wwi_f';
data.Wwi_f = 400e3;units.Wwi_f = 'g';   label.Wwi_f = 'ultimate wet weight (female)';    bibkey.Wwi_f = {'fishbase','KohlCase1996'};

data.Ri  = 35/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';                 bibkey.Ri  = 'fishbase'; 
  temp.Ri = C2K(26.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '20 till 50 pups per litter';

% uni-variate data at f
% time-length
data.tL_f = [ ... % time since birth (yr), fork length (cm)
3.969	140.352
5.938	167.773
5.938	168.872
5.969	164.842
6.000	150.189
6.954	170.310
6.954	171.776
6.954	173.241
6.954	173.973
6.985	175.804
6.985	179.833
7.015	165.913
7.046	188.257
7.938	177.611
7.969	169.185
7.969	172.115
7.969	180.174
7.969	182.005
7.969	183.104
7.969	184.203
7.969	185.668
7.969	186.767
8.000	173.580
8.000	190.063
8.031	188.963
8.954	169.525
8.954	181.613
8.954	183.079
8.954	184.910
8.954	186.009
8.954	187.474
8.954	192.236
8.954	193.335
8.954	194.434
8.954	195.533
8.985	202.858
8.985	206.887
10.000	183.784
10.000	186.714
10.000	187.813
10.000	189.645
10.000	196.971
10.923	188.888
10.954	189.620
10.954	194.748
10.954	204.272
11.969	189.593
11.969	191.058
11.969	199.849
13.969	225.072
14.954	217.354
14.954	218.819
14.954	222.116
14.954	224.680
18.000	227.530
18.000	232.292];
data.tL_f(:,1) = 365 * (.5 + data.tL_f(:,1)); % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'};     label.tL_f = {'time since birth', 'fork length', 'female'};  
  temp.tL_f = C2K(26.5); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'CoelFern2011';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), fork length (cm)
3.972	135.998
4.095	136.371
4.996	161.693
4.996	163.158
4.997	165.722
4.997	167.187
5.951	165.772
5.980	161.378
5.982	167.239
5.982	168.338
5.983	169.437
5.983	170.169
5.983	171.268
5.984	172.733
6.010	157.350
6.966	164.360
6.966	165.825
6.967	167.290
6.967	169.122
6.968	170.587
6.968	171.686
6.968	173.151
7.001	178.281
7.001	179.014
7.001	180.845
7.801	178.323
7.924	180.527
7.925	182.725
7.954	176.866
7.985	175.768
7.988	187.124
7.989	189.688
8.014	171.008
8.014	173.206
8.015	173.939
8.015	174.671
9.004	187.910
9.031	177.655
9.032	179.120
9.033	182.050
9.033	183.882
9.034	185.713
9.034	186.446
10.015	175.508
10.016	179.171
10.017	181.369
10.017	182.102
10.018	183.567
10.018	185.032
10.021	195.289
11.005	192.410
11.006	195.340
11.007	198.271
11.989	190.264
11.992	200.520
12.977	202.770
12.978	205.700
13.012	216.691
14.978	205.805
17.014	222.028
17.017	230.454];
data.tL_m(:,1) = 365 * (.5 + data.tL_m(:,1)); % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'};     label.tL_m = {'time since birth', 'fork length', 'male'};
  temp.tL_m = C2K(26.5); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'CoelFern2011';
comment.tL_m = 'Data for males';

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

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '4Z2QW'; % Cat of Life
metaData.links.id_ITIS = '160505'; % ITIS
metaData.links.id_EoL = '46559950'; % Ency of Life
metaData.links.id_Wiki = 'Sphyrna_zygaena'; % Wikipedia
metaData.links.id_ADW = 'Sphyrna_zygaena'; % ADW
metaData.links.id_Taxo = '42010'; % Taxonomicon
metaData.links.id_WoRMS = '105819'; % WoRMS
metaData.links.id_fishbase = 'Sphyrna-zygaena'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sphyrna_lewini}}';  
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
bibkey = 'KohlCase1996'; type = 'Techreport'; bib = [ ...  
'author = {N. E. Kohler and J. G. Casey and P. A. Turner}, ' ...
'year = {1996}, ' ...
'title  = {Length-Length and Length-Weight Relationships for 13 Shark Species from the {W}estern {N}orth {A}tlantic}, ' ...
'institution = {Northeast Region Northeast Fisheries Science Center Woods Hole, Massachusetts}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CoelFern2011'; type = 'Article'; bib = [ ...  
'author = {R. Coelho and J. Fernandez-Carvalho and S. Amorim1 and M. N. Santos}, ' ...
'year = {2011}, ' ...
'title  = {Age and growth of the smooth hammerhead shark, \emph{Sphyrna zygaena}, in the {Eastern Equatorial Atlantic Ocean}, using vertebral sections}, ' ...
'journal = {Aquat. Living Resour.)}, ' ...
'volume = {24}, ' ...
'pages = {351-357}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/917}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  