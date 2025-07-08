function [data, auxData, metaData, txtData, weights] = mydata_Natrix_maura

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Colubridae';
metaData.species    = 'Natrix_maura'; 
metaData.species_en = 'viperine water snake'; 

metaData.ecoCode.climate = {'BSk', 'BWh', 'Cfb', 'Csa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0bFr', 'biFc'};
metaData.ecoCode.embryo  = {'Tl'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 30];              
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

data.ab = 44.2;     units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = 'AubrBlan2015';
  temp.ab = C2K(28); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 5*365;   units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'HailDavi1987';
  temp.tp = C2K(18); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 2*365;    units.tpm = 'd';    label.tpm = 'time since birth at puberty';  bibkey.tpm = 'HailDavi1987';
  temp.tpm = C2K(18); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 30*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'stevenbol';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 13.25;    units.Lb  = 'cm';  label.Lb  = 'SVL at hatching';      bibkey.Lb  = 'AubrBlan2015';  
data.Lp  = 26;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';      bibkey.Lp  = 'HailDavi1987';  
data.Lpm = 20.5;  units.Lpm  = 'cm'; label.Lpm  = 'total length at puberty for males';      bibkey.Lpm  = 'HailDavi1987';  
data.Li  = 68;    units.Li  = 'cm';  label.Li  = 'ultimate SVL for female'; bibkey.Li  = 'Wiki';
  comment.Li = 'total length 85 cm, tail length 17 cm';
data.Lim  = 40;    units.Lim = 'cm';  label.Lim  = 'ultimate total length for male';  bibkey.Lim  = 'stevenbol';
  comment.Lim = 'based on TL 50 cm: 50*68/85 cm';

data.Wwb = 2.55;     units.Wwb = 'g';  label.Wwb = 'wet at birth'; bibkey.Wwb = 'AubrBlan2015';
data.Wwi = 384;   units.Wwi = 'g';  label.Wwi = 'ultimate wet '; bibkey.Wwi = 'EoL';
  
data.Ri  = 22/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'AubrBlan2015';   
  temp.Ri = C2K(18);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% t-L data females
data.tL_f = [ ... % time since birth (yr), total (cm)
0.125	13.089
0.826	19.336
4.798	25.858
9.882	32.860
14.004	37.117];
data.tL_f(:,1) = data.tL_f(:,1) * 365;
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f   = C2K(18);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'HailDavi1987';
comment.tL_f = 'data for females';
% males
data.tL_m = [ ... % time since birth (yr), total (cm)
0.002	12.952
0.945	19.680
4.380	22.426
8.123	24.897
9.859	25.995];
data.tL_m(:,1) = data.tL_m(:,1) * 365;
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m   = C2K(18);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'HailDavi1987';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2; 

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Males raise body temp after hibernation to boost sperm production';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6S63L'; % Cat of Life
metaData.links.id_ITIS = '700797'; % ITIS
metaData.links.id_EoL = '458673'; % Ency of Life
metaData.links.id_Wiki = 'Natrix_maura'; % Wikipedia
metaData.links.id_ADW = 'Natrix_maura'; % ADW
metaData.links.id_Taxo = '50028'; % Taxonomicon
metaData.links.id_WoRMS = '1527803'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Natrix&species=maura'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Natrix_maura}}';
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
bibkey = 'HailDavi1987'; type = 'Article'; bib = [ ... 
'author = {Adrian Hailey and P.M.C. Davies}, ' ... 
'year = {1987}, ' ...
'title = {Growth, movement and population dynamics of \emph{Natrix maura} in drying river}, ' ...
'journal = {Herpetological Journal}, ' ...
'volume = {1}, ' ...
'pages = {185-194}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AubrBlan2015'; type = 'Article'; bib = [ ... 
'doi = {10.1038/srep13385}, ' ...
'author = {Fabien Aubret and Ga\"{e}lle Blanvillain and Philippe J. R. Kok}, ' ... 
'year = {2015}, ' ...
'title = {Myth busting? Effects of embryo positioning and egg turning on hatching success in the water snake \emph{Natrix maura}}, ' ...
'journal = {Nature Scientific Reports}, ' ...
'volume = {5}, ' ...
'pages = {13385}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/458673}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'stevenbol'; type = 'Misc'; bib = ...
'howpublished = {\url{https://stevenbolgartersnakes.com/species/natrix-maura/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
