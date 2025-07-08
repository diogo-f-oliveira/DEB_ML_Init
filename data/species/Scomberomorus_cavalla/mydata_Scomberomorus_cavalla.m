function [data, auxData, metaData, txtData, weights] = mydata_Scomberomorus_cavalla
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Scombridae';
metaData.species    = 'Scomberomorus_cavalla'; 
metaData.species_en = 'King mackerel'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MIN', 'MPSW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.2); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_T'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2023 10 18];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 18];

%% set data
% zero-variate data

data.am = 26*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(27.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 64.8;   units.Lp  = 'cm';  label.Lp  = 'fork length at puberty for female';  bibkey.Lp  = 'fishbase'; 
  comment.Lp = 'strong regional differences exist; fishbase and McIlClae2005 give 70 cm';
data.Li  = 184;     units.Li  = 'cm';  label.Li  = 'ultimate fork length';    bibkey.Li  = 'fishbase';

data.Wwb = 6.5e-5;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.5 mm of Scomberomorus_commerson: pi/6*0.05^3';
data.Wwp = 1.97e3;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on (Lp/Li)^3*Wwi';
data.Wwi = 45e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';


data.Ri  = 12.2e6/365; units.Ri  = '#/d';label.Ri  = 'max reprod rate';    bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(27.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

% time-length
data.tL_f = [ ... % yr class (yr), fork length (cm)
0.911	48.679
1.896	63.879
3.022	71.467
3.952	77.918
5.124	81.320
6.101	85.107
7.079	89.654
8.055	92.680
9.129	95.704
10.105	97.589
11.033	100.235
12.009	102.500
13.081	103.622
14.059	107.789
15.231	111.952
16.158	113.077
16.986	113.062
18.058	113.423
19.176	109.979
20.057	114.908
21.229	119.452]; 
data.tL_f(:,1) = (0.5 + data.tL_f(:,1)) * 365;   % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length', 'female'};  
temp.tL_f    = C2K(27.2);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'CollSchm1989';
comment.tL_f = 'Data for females';
% 
data.tL_m = [ ... % yr class (yr), fork length (cm)
0.914	42.843
1.945	57.113
2.971	63.591
4.045	68.120
5.021	71.676
6.046	75.231
7.119	77.812
8.095	80.070
9.119	81.353
10.094	83.935
11.118	85.218
12.045	86.827
13.167	89.082
13.996	91.018
15.214	90.999
16.189	93.256]; 
data.tL_m(:,1) = (0.5 + data.tL_m(:,1)) * 365;   % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length', 'male'};  
temp.tL_m    = C2K(27.2);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'CollSchm1989';
comment.tL_m = 'Data for males';

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

%% Discussion
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '6XXKJ'; % Cat of Life
metaData.links.id_ITIS = '172435'; % ITIS
metaData.links.id_EoL = '46577314'; % Ency of Life
metaData.links.id_Wiki = 'Scomberomorus_cavalla'; % Wikipedia
metaData.links.id_ADW = 'Scomberomorus_cavalla'; % ADW
metaData.links.id_Taxo = '46697'; % Taxonomicon
metaData.links.id_WoRMS = '159340'; % WoRMS
metaData.links.id_fishbase = 'Scomberomorus-cavalla'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Scomberomorus_cavalla}}';
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
bibkey = 'CollSchm1989'; type = 'Article'; bib = [ ... 
'author = {Mark R. Collins and David J. Schmidt and C. Wayne Waltz}, ' ... 
'year = {1989}, ' ...
'title = {Age and Growth of King Mackerel, \emph{Scomberomorus cavalla}, from the {A}tlantic Coast of the {U}nited {S}tates}, ' ...
'journal = {Fishery Bulletin}, ' ...
'volume = {87(1)}, ' ...
'pages = {49-61}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Scomberomorus-cavalla.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
