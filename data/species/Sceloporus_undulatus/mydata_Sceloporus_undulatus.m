function [data, auxData, metaData, txtData, weights] = mydata_Sceloporus_undulatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Phrynosomatidae';
metaData.species    = 'Sceloporus_undulatus'; 
metaData.species_en = 'Eastern fence lizard'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa', 'BSk'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf', '0iTh'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Michael Kearney'};    
metaData.date_subm = [2011 02 03];              
metaData.email    = {'m.kearney@unimelb.edu.au'};            
metaData.address  = {'University of Melbourne'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2011 03 28];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'}; 

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2023 01 01];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 01];

%% set data
% zero-variate data

data.ab = 52+10;  units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = {'AndrMath2000', 'ParkAndr2004'};   
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '52 d (AndrMath2000) plus 10 d at 28 to get to roughly the stage at oviposition (ParkAndr2004)';
data.ap = 5*30.5; units.ap = 'd';    label.ap = 'age at puberty';            bibkey.ap = {'FergTale1993','AndrMath2000'};
  temp.ap = C2K(28.9);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 6*465;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'AndrMath2000';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 2.5;   units.Lb  = 'cm';  label.Lb  = 'SVL at birth';    bibkey.Lb  = {'Tink1972','TinkBall1972'};  
data.Lp  = 5.8;   units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';  bibkey.Lp  = {'Tink1972','TinkBall1972'}; 
data.Li  = 8;     units.Li  = 'cm';  label.Li  = 'ultimate SVL';    bibkey.Li  = {'Tink1972','TinkBall1972'};

data.Wwb = 0.56;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = {'Tink1972','TinkBall1972'};
data.Wwp = 6.9;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'Tink1972','TinkBall1972'};
data.Wwi = 18;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = {'Tink1972','TinkBall1972'};

data.Ri  = 40.077/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = {'Tink1972','TinkBall1972'};   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% univariate data
% time-length
data.tL_fm = [ ... % time since birth (mnth), SVL (cm)
0	2.561 2.506
1	3.515 3.487
2	4.026 4.051
9	5.039 4.856
10	5.515 5.101
11	5.759 5.363
12	6.057 5.670
13	6.346 5.720
14	6.157 5.574
21	6.656 5.931
22	6.828 6.007
23	6.682 5.914
24	6.837 6.122
25	7.196 6.108
34	7.030 6.343
35	6.753 NaN];
data.tL_fm(:,1) = data.tL_fm(:,1) * 30.5; % convert mnth to d
units.tL_fm  = {'d', 'cm'};  label.tL_fm = {'time since birth', 'SVL'};  
temp.tL_fm   = C2K(30);  units.temp.tL_fm = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_fm = 'JoneBall1987'; treat.tL_fm = {1, {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'This entry is discussed in Kear2012';
D2 = 'mod_2: tL data added, where T is assumed to vary as T(t) = 15+25*sin(2*pi*(t+100)/365) in C';
D3 = 'mod_2: males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '4V5CX'; % Cat of Life
metaData.links.id_ITIS = '173865'; % ITIS
metaData.links.id_EoL = '47364857'; % Ency of Life
metaData.links.id_Wiki = 'Sceloporus_undulatus'; % Wikipedia
metaData.links.id_ADW = 'Sceloporus_undulatus'; % ADW
metaData.links.id_Taxo = '49023'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Sceloporus&species=undulatus'; % ReptileDB
metaData.links.id_AnAge = 'Sceloporus_undulatus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sceloporus_undulatus}}';
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
bibkey = 'Tink1972'; type = 'Article'; bib = [ ... 
'author = {Tinkle, D. W.}, ' ... 
'year = {1972}, ' ...
'title = {The dynamics of a Utah population of \emph{Sceloporus undulatus}}, ' ...
'journal = {Herpetologica}, ' ...
'volume = {28}, ' ...
'pages = {351-359}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FergTale1993'; type = 'Article'; bib = [ ... 
'author = {Ferguson, G. W. and Talent, L. G.}, ' ... 
'year = {1993}, ' ...
'title = {Life-history traits of the lizard \emph{Sceloporus undulatus} from two populations raised in a common laboratory environment.}, ' ...
'journal = {Oecologia}, ' ...
'volume = {93}, ' ...
'pages = {88--94}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TinkBall1972'; type = 'Article'; bib = [ ... 
'author = {Tinkle, D. W. and Ballinger, R. E.}, ' ... 
'year = {1972}, ' ...
'title = {Sceloporus undulatus: a study of the intraspecific comparative demography of a lizard}, ' ...
'journal = {Ecology}, ' ...
'volume = {53}, ' ...
'pages = {570-584}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kear2012'; type = 'Article'; bib = [ ... 
'author = {Kearney, M. R.}, ' ... 
'year = {2012}, ' ...
'title = {Metabolic theory, life history and the distribution of a terrestrial ectotherm}, ' ...
'journal = {Functional Ecology}, ' ...
'volume = {26}, ' ...
'pages = {167-179}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AndrMath2000'; type = 'Article'; bib = [ ... 
'author = {Andrews, R. M. and Mathies, T. and Warner, D. A.}, ' ... 
'year = {2000}, ' ...
'title = {Effect of incubation temperature on morphology, growth and survival of juvenile \emph{Sceloporus undulatus}}, ' ...
'journal = {Herpetological Monographs}, ' ...
'volume = {14}, ' ...
'pages = {420-43}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ParkAndr2004'; type = 'Article'; bib = [ ... 
'author = {Parker, S. L. and Andrews, R. M. and Mathies, T.}, ' ... 
'year = {2004}, ' ...
'title = {Ebryonic responses to variation in oviductal oxygen in the lizard \emph{Sceloporus undulatus} from {N}ew {J}ersey and {S}outh {C}arolina, {U}{S}{A}}, ' ...
'journal = {Biological Journal of the Linnean Society}, ' ...
'volume = {83}, ' ...
'pages = {289-299}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JoneBall1987'; type = 'Article'; bib = [ ... 
'author = {Steven M. Jones and Royce E. Ballinger}, ' ... 
'year = {1987}, ' ...
'title = {Comparative Life Histories of \emph{Holbrookia Maculata} and {Sceloporus undulatus} in {W}estern {N}ebraska}, ' ...
'journal = {Ecology}, ' ...
'volume = {68(6)}, ' ...
'pages = {1828-1838}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
