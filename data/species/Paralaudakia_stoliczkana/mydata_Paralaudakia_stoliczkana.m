function [data, auxData, metaData, txtData, weights] = mydata_Paralaudakia_stoliczkana

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Agamidae';
metaData.species    = 'Paralaudakia_stoliczkana'; 
metaData.species_en = 'Mongolia rock agama'; 

metaData.ecoCode.climate = {'BWh', 'BSh', 'Csa', 'Csb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTa', '0iTd', '0iTs', '0iTh'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 06];              
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

data.ab = 7.5*7;  units.ab = 'd';    label.ab = 'age at birth';         bibkey.ab = 'Wiki';   
  temp.ab = C2K(23); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'for Agamidae: 7 till 8 weeks';
data.tp = 5*365;     units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'SmirAnan2007';
  temp.tp = C2K(23); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 9*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'SmirAnan2007';   
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 2.5;    units.Lb  = 'cm';  label.Lb  = 'SVL at hatching';      bibkey.Lb  = 'guess'; 
  comment.Lb = 'based on Calotes versicolor';
data.Lp  = 9.5;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';       bibkey.Lp  = 'SmirAnan2007';  
data.Li  = 13.1;     units.Li  = 'cm';  label.Li  = 'ultimate SVL for females'; bibkey.Li  = 'Pete1971';  
data.Lim  = 14.3;     units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males'; bibkey.Lim  = 'Pete1971';  

data.Wwi = 69.3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet '; bibkey.Wwi = 'Pete1971';

data.Ri  = 15/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(23);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'for Agamidae: 6 till 10 eggs per clutch, assumed twice per year';

% univariate data 
% time-length
data.tL_f = [ ... % time since birth (yr), SVL (cm)
    1  5.9
    1  6.0
    1  6.4
    1  6.6
    1  7.6
    3  8.2
    4  9.6
    8 13.3];
data.tL_f(:,1) = (data.tL_f(:,1)+.7) * 365; % convert yr to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'SVL', 'female'};  
temp.tL_f   = C2K(23);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'SmirAnan2007';
comment.tL_f = 'Data for females in Kostek, 50 m';
%
data.tL_m = [ ... % time since birth (yr), SVL (cm)
    1  8.1
    3  8.5
    4  9.5
    6 11.3
    7 12.2
    8 13.8];
data.tL_m(:,1) = (data.tL_m(:,1)+.7) * 365; % convert yr to d
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'SVL', 'male'};  
temp.tL_m   = C2K(23);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'SmirAnan2007';
comment.tL_m = 'Data for males in Kostek, 50 m';

% length-weight
data.LW_f = [ ... SVL (cm), weight (g)
    8.7 19.8
    9.9 31.0
   10.8 38.5
   11.2 37.5
   11.9 52.6
   13.1 69.3];
units.LW_f  = {'cm', 'g'};  label.LW_f = {'SVL', 'weight', 'female'};  
bibkey.LW_f = 'Pete1971';
%
data.LW_m = [ ... SVL (cm), weight (g)
    6.55   9.0
    6.4    9.1
    6.55   9.0
    9.3   26.1
   13.1   84.4
   13.2  108.0
   13.6   96.6
   13.8  103.0
   13.8  112.0
   14.0  116.0
   14.2  122.0
   14.3  111.0
   14.3  130.0];
units.LW_m  = {'cm', 'g'};  label.LW_m = {'SVL', 'weight', 'male'};  
bibkey.LW_m = 'Pete1971';

%% set weights for all real data
weights = setweights(data, []);
weights.Lb = 50 * weights.Lb;

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
set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '4CY5Y'; % Cat of Life
metaData.links.id_ITIS = '1056827'; % ITIS
metaData.links.id_EoL = '40084485'; % Ency of Life
metaData.links.id_Wiki = 'Paralaudakia_stoliczkana'; % Wikipedia
metaData.links.id_ADW = 'Laudakia_stoliczkana'; % ADW
metaData.links.id_Taxo = '4684224'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Paralaudakia&species=stoliczkana'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Paralaudakia_stoliczkana}}';
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
bibkey = 'SmirAnan2007'; type = 'Article'; bib = [ ... 
'doi = {10.1163/156853807780202512}, ' ...
'author = {Smirina, E. and Ananjeva, N.}, ' ... 
'year = {2007}, ' ...
'title = {Growth layers in bones and acrodont teeth of the agamid lizard \emph{Laudakia stoliczkana} ({B}lanford, 1875) ({A}gamidae, {S}auria)}, ' ...
'journal = {Amphibia-Reptilia}, ' ...
'volume = {28(2)}, ' ...
'pages = {193–204}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Pete1971'; type = 'Article'; bib = [ ... 
'howpublished = {\url{https://lacerta.de/AF/Bibliografie/BIB_12790_X.pdf}}, ' ...
'author = {G\"{u}nther Peters}, ' ... 
'year = {1971}, ' ...
'title = {Die {W}iterlschw\"{a}nze {Z}entralasiens ({A}gamidae: \empg{Agama})}, ' ...
'journal = {Mitteilungen aus dem Zoologische Museum in Berlin}, ' ...
'volume = {47(2)}, ' ...
'pages = {357-381}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

