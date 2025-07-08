function [data, auxData, metaData, txtData, weights] = mydata_Mertensiella_caucasica

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Salamandridae';
metaData.species    = 'Chioglossa_lusitanica'; 
metaData.species_en = 'Gold-striped salamander'; 

metaData.ecoCode.climate = {'Cfb', 'Csb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFc', 'jiTf'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                        
metaData.date_subm = [2019 06 29];                            
metaData.email    = {'bas.kooijman@vu.nl'};                   
metaData.address  = {'VU University, 1818HV Amsterdam, the Netherlands'};        

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data;
data.ab = 42;       units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'amphibiaweb';
  temp.ab = C2K(6); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '6 to 10 w';
data.am = 10*365;  units.am = 'd';    label.am = 'life span';                   bibkey.am = 'Wiki';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 1.25;      units.Lb = 'cm';   label.Lb = 'SVL at birth';  bibkey.Lb = 'amphibiaweb';
data.Lj = 2.2;       units.Lj = 'cm';   label.Lj = 'SVL at metam';  bibkey.Lj = 'amphibiaweb';
data.Lp = 4.0;       units.Lp = 'cm';   label.Lp = 'SVL at puberty';  bibkey.Lp = 'LimaArnt2000';
data.Li = 5.5;       units.Li = 'cm';   label.Li = 'ultimate SVL for females';  bibkey.Li = 'EoL';
  comment.Li = 'based on TL 164 mm, using F1';
data.Lim = 5.2;      units.Lim = 'cm';   label.Lim = 'ultimate SVL for males';  bibkey.Lim = 'EoL';
  comment.Lim = 'based on TL 156 mm, using F1';

data.Wwb = 0.144;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'amphibiaweb';
  comment.Wwb = 'based on egg diameter of 5 to 8 mm: pi/6*0.65^3'; 
data.Wwp = 1.29;       units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'guess';
  comment.Wwim = 'based on length-weight of Mertensiella_caucasica: (4/6.75)^3*4.7';
data.Wwi = 3.41;       units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'guess';
  comment.Wwi = 'based on length-weight of Mertensiella_caucasica: (5.5/6.75)^3*4.7';
data.Wwim = 2.83;      units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'guess';
  comment.Wwim = 'based on length-weight of Mertensiella_caucasica, correcting for long tail: (5.2/6.75)^3*6.2';

data.Ri  = 17/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'amphibiaweb';   
  temp.Ri = C2K(15); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '14 to 17 eggs per clutch, 1 clutch per yr';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), SVL (cm) for larvae
12.096	1.406
20.104	1.368
32.017	1.397
46.226	1.335
96.010	1.637
115.193	1.740
133.859	1.844
151.736	1.912
166.744	1.912
179.918	1.849
195.478	1.950
210.485	1.950
236.339	1.890
365+12.391	2.260
365+21.216	2.342
365+30.804	2.383
365+44.481	2.277
365+95.214	2.328];
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'SVL', 'larva'};  
temp.tL   = C2K(8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Arnt1981';
comment.tL = 'data for larvae';
%
data.tL_f = [ ... % time since birth (yr), SVL (cm)
2.577	3.780
3.166	4.030
3.849	4.274
5.113	4.522
6.768	4.702];
data.tL_f(:,1) = 365 * data.tL_f(:,1);
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'SVL', 'female'};  
temp.tL_f   = C2K(18);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'LimaArnt2000';
comment.tL_f = 'data for females, stylized data from Silveirinha';
%
data.tL_m = [ ... % time since birth (yr), SVL (cm)
2.587	3.771
3.334	4.080
3.934	4.235
4.556	4.339
5.810	4.465];
data.tL_m(:,1) = 365 * data.tL_m(:,1);
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'SVL', 'male'};  
temp.tL_m   = C2K(15);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'LimaArnt2000';
comment.tL_m = 'data for males, stylized data from Silveirinha';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Lb = 5 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL','tL_m'}; subtitle1 = {'Data for females, larvae, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% facts
F1 = 'length-length: SVL = 0.33*TL';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'It may shed its tail like a lizard if it feels threatened';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '5Y477'; % Cat of Life
metaData.links.id_ITIS = '668361'; % ITIS
metaData.links.id_EoL = '289670'; % Ency of Life
metaData.links.id_Wiki = 'Chioglossa_lusitanica'; % Wikipedia
metaData.links.id_ADW = 'Chioglossa_lusitanica'; % ADW
metaData.links.id_Taxo = '47274'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Chioglossa+lusitanica'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chioglossa_lusitanica}}';   
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
bibkey = 'Arnt1981'; type = 'Article'; bib = [ ... 
'author = {J. W. Arntzen}, ' ... 
'year = {1981}, ' ...
'title = {Ecological Observations on \emph{Chioglossa lusitanica} ({C}audata, {S}alamandridae)}, ' ...
'journal = {Amphibia-Reptilia}, ' ...
'volume = {3/4}, ' ...
'pages = {187-203}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LimaArnt2000'; type = 'Article'; bib = [ ... 
'author = {V. Lima and J. W. Arntzen and N. M. Ferrand}, ' ... 
'year = {2000}, ' ...
'title = {Age structure and growth pattern in two populations of the golden-striped salamander \emph{Chioglossa lusitanica} ({C}audata, {S}alamandridae)}, ' ...
'journal = {Amphibia-Reptilia}, ' ...
'volume = {22}, ' ...
'pages = {55-68}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Chioglossa+lusitanica}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/289670/articles}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

