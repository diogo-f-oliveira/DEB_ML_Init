function [data, auxData, metaData, txtData, weights] = mydata_Plethodon_kentucki

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Plethodontidae';
metaData.species    = 'Plethodon_kentucki'; 
metaData.species_en = 'Cumberland Plateau salamander'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jFc', 'jiTf'};
metaData.ecoCode.embryo  = {'Tns'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 23];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.ab = 15;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'amphibiaweb';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'value for Plethodon cinereus';
data.tp = 5*365;  units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'Marv2017';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 4*365;  units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'Marv2017';
  temp.tpm = C2K(15);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 16*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Marv2017';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 4.7;     units.Lp  = 'cm';  label.Lp  = 'SVL at puberty '; bibkey.Lp  = 'Marv2017'; 
  comment.Lp = 'based on tL_f data for tp';
data.Lpm  = 5.2;     units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for males'; bibkey.Lpm  = 'Marv2017'; 
  comment.Lpm = 'based on tL_m data for tpm';
data.Li  = 6.3;    units.Li  = 'cm';  label.Li  = 'ultimate SVL';   bibkey.Li  = 'Marv2017';
data.Lim  = 5.8;    units.Lim  = 'cm';  label.Lim  = 'ultimate SVL';   bibkey.Lim  = 'Marv2017';

data.Wwb = 1.41e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Wiki';
  comment.Wwb = 'based on egg diameter of 2.5 to 3.2 mm for Plethodon cinereus: pi/6*0.3^3';
data.Wwi = 1.94;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on size-corrected value for Plethodon cinereus: (6.3/4.69)^3*0.8';

data.Ri  = 12/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'amphibiaweb';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '9 to 12 eggs per clutch, 1 clutch each yr assumed';

% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), SVL (cm)
1.979	3.402
2.040	3.185
3.026	4.207
3.032	4.521
4.007	4.907
4.069	4.794
5.075	5.108
5.077	5.205
6.077	5.213
6.082	5.486
6.083	5.518
7.084	5.591
8.054	5.703
9.021	5.655
9.027	6.009
10.094	6.114
11.055	5.752
11.056	5.816
12.059	6.017
12.082	5.510
13.090	5.913
16.095	6.202];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f  = {'d', 'cm'}; label.tL_f = {'time since birth', 'SVL', 'female'};  
temp.tL_f   = C2K(15); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Marv2017';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), SVL (cm)
2.036	2.992
3.057	4.110
3.058	4.143
4.005	4.818
4.007	4.907
4.031	4.497
4.035	4.698
5.007	4.907
5.010	5.100
5.041	4.995
5.077	5.205
6.077	5.205
6.079	5.301
6.081	5.430
7.016	5.398
7.018	5.510
7.020	5.615
8.049	5.454
8.054	5.720
9.019	5.559
9.046	5.309
10.081	5.462
11.016	5.406
11.022	5.720
11.050	5.510
12.048	5.406
12.989	5.720
13.088	5.816];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m  = {'d', 'cm'}; label.tL_m = {'time since birth', 'SVL', 'male'};  
temp.tL_m   = C2K(15); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Marv2017';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hm only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1 = 'Males slightly smaller than females';
metaData.bibkey.F1 = 'Marv2017'; 
F2 = 'The larval stage is passed within the egg capsule; reproduction is terrestrial';
metaData.bibkey.F2 = 'amphibiaweb'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Acknowledgment
metaData.acknowledgment = 'Eric Liebgold kindly helped collecting data for this entry';

%% Links
metaData.links.id_CoL = '6W27W'; % Cat of Life
metaData.links.id_ITIS = '208275'; % ITIS
metaData.links.id_EoL = '331206'; % Ency of Life
metaData.links.id_Wiki = 'Plethodon_kentucki'; % Wikipedia
metaData.links.id_ADW = 'Plethodon_kentucki'; % ADW
metaData.links.id_Taxo = '143013'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Plethodon+kentucki'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Plethodon_kentucki}}';
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
bibkey = 'Marv2017'; type = 'Article'; bib = [ ... 
'author = {Glenn A. Marvin}, ' ... 
'year = {2017}, ' ...
'title = {Age, Growth, and Long-Term Site Fidelity in the Terrestrial Plethodontid Salamander \emph{Plethodon kentucki}}, ' ...
'journal = {Copeia}, ' ...
'volume = {2001(1)}, ' ...
'pages = {108-117}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Plethodon+kentucki}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

