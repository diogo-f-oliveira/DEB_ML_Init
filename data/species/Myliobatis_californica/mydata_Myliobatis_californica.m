function [data, auxData, metaData, txtData, weights] = mydata_Myliobatis_californica
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Myliobatiformes'; 
metaData.family     = 'Myliobatidae';
metaData.species    = 'Myliobatis_californica'; 
metaData.species_en = 'Bat ray'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20.6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 28];                          
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
data.ab = 12*30.5;    units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'ADW';    
  temp.ab = C2K(20.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '8-12 mnth';
data.am = 23*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'MartCail1988';   
  temp.am = C2K(20.6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 27;   units.Lb  = 'cm';  label.Lb  = 'disc width at birth';   bibkey.Lb  = 'MartCail1988';
data.Lp = 67.5;   units.Lp  = 'cm';  label.Lp  = 'disc width at puberty'; bibkey.Lp  = 'ADW'; 
data.Li  = 158.7;  units.Li  = 'cm';  label.Li  = 'ultimate disc width';   bibkey.Li  = 'fishbase'; 
data.Lim  = 101.7;  units.Lim  = 'cm';  label.Lim  = 'ultimate disc width';   bibkey.Lim  = 'fishbase'; 

data.Wwi  = 63.4e3;  units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';   bibkey.Wwi  = 'MartCail1988'; 
  comment.Wwi = 'based on Wwim*(Li/Lim)^3';
data.Wwim  = 16.78e3;  units.Wwim  = 'g';  label.Wwim  = 'ultimate wet weight';   bibkey.Wwim  = 'MartCail1988'; 

data.Ri  = 12/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(20.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), disc width (cm)
    0  27.5
    1  32.9
    2  45.9
    3  55.0
    4  63.9
    5  72.6
    6  80.0
    7  88.1
    8  95.4
    9 103.4
   10 106.0
   11 109.8
   12 113.0
   13 114.8
   14 117.1
   15 120.9
   16 125.8
   17 127.2
   18 130.6
   19 134.3
   20 139.1
   21 142.5
   22 145.9
   23 151.0];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f  = {'d','cm'}; label.tL_f  = {'time since birth','disc width','female'}; 
temp.tL_f = C2K(20.6); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'MartCail1988';  
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), disc width (cm)
    0 27.7
    1 36.4
    2 45.6
    3 55.3
    4 63.4
    5 71.2
    6 76.6];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
units.tL_m  = {'d','cm'}; label.tL_m  = {'time since birth','disc width','male'}; 
temp.tL_m = C2K(20.6); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'MartCail1988';  
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;
weights.ab = 3 * weights.ab;

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
D1 = 'The cost for milk secretion is added to the investment from the reproduction buffer.';
D2 = 'Males are supposed to differ from females by {p_Am} only';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight: Ww in g = 0.00389 *(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'At first, they are enclosed in an egg case while the developing embryos feed on the yolk. After the egg hatches, the pup remains in the oviduct and receives nourishment from a milky secretion';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '453CB'; % Cat of Life
metaData.links.id_ITIS = '160981'; % ITIS
metaData.links.id_EoL = '46561010'; % Ency of Life
metaData.links.id_Wiki = 'Myliobatis_californica'; % Wikipedia
metaData.links.id_ADW = 'Myliobatis_californica'; % ADW
metaData.links.id_Taxo = '180553'; % Taxonomicon
metaData.links.id_WoRMS = '271485'; % WoRMS
metaData.links.id_fishbase = 'Myliobatis-californica'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Myliobatis_californica}}';   
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Myliobatis-californica}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Myliobatis_californica/}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MartCail1988'; type = 'Article'; bib = [ ... 
'author = {Linda K. Martin and Gregor M. Cailliet}, ' ...
'year = {1988}, ' ...
'title  = {Age and Growth Determination of the Bat Ray, \emph{Myliobatis californica} {G}ill, in {C}entral {C}alifornia}, ' ...
'journal = {Copeia}, ' ...
'volume = {1988(3)}, ' ...
'pages = {762-773}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

