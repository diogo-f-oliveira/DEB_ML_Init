function [data, auxData, metaData, txtData, weights] = mydata_Myliobatis_aquila
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Myliobatiformes'; 
metaData.family     = 'Myliobatidae';
metaData.species    = 'Myliobatis_aquila'; 
metaData.species_en = 'Common eagle ray'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW','MAm','MIE'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-Ww'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 09];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 09];

%% set data
% zero-variate data;
data.ab = 7*30.5;    units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'fishbase';    
  temp.ab = C2K(15.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '8-12 mnth';
data.am = 23*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(15.2); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 26.5; units.Lb  = 'cm';  label.Lb  = 'disc width at birth';   bibkey.Lb  = 'CapaGuel2007';
data.Lp  = 73;   units.Lp  = 'cm';  label.Lp  = 'disc width at puberty'; bibkey.Lp  = 'CapaGuel2007'; 
data.Lpm = 52;   units.Lpm = 'cm';  label.Lpm = 'disc width at puberty for males'; bibkey.Lpm  = 'CapaGuel2007'; 
data.Li  = 183;  units.Li  = 'cm';  label.Li  = 'ultimate disc width';   bibkey.Li  = 'fishbase'; 
data.Lim = 72;   units.Lim = 'cm';  label.Lim = 'ultimate disc width for males';   bibkey.Lim  = 'fishbase'; 

data.Wwi  = 36.2e3;  units.Wwi  = 'g';  label.Wwi  = 'ulitmate wet weight';   bibkey.Wwi  = 'fishbase'; 
  comment.Wwi = 'based on 0.00389*Li^3.08, see F1; max published weight: 14.3 kg';

data.Ri  = 7/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(15.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'CapaGuel2007: max fecundity 15';
  
% univariate data
% length-weight
data.LW_f = [ ... % disc width (cm), weight (g)
    21.0   166
    49.0  1495
    46.0  1600
    52.0  1780
    24.0   190
    47.0  1405
    36.0   862
    70.0  4850
    73.0  6100
   114.0 29400];
units.LW_f  = {'cm','g'}; label.LW_f  = {'disc width','weight','females'}; 
bibkey.LW_f  = 'CapaGuel2007';  
%
data.LW_m = [ ... % disc width (cm), weight (g)
    50.0 2000
    72.0 5250
    71.0 5460];
units.LW_m  = {'cm','g'}; label.LW_m  = {'disc width','weight','males'}; 
bibkey.LW_m  = 'CapaGuel2007';  

%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = 0*weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are supposed to differ from females by {p_Am} and E_Hp only';
D2 = 'The cost for milk secretion is added to the investment from the reproduction buffer';
D3 = 'Wwi is ignorned, due to inconsistency with Li';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight: Ww in g = 0.00389*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'At first, they are enclosed in an egg case while the developing embryos feed on the yolk. After the egg hatches, the pup remains in the oviduct and receives nourishment from a milky secretion';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '453C6'; % Cat of Life
metaData.links.id_ITIS = '160983'; % ITIS
metaData.links.id_EoL = '46561008'; % Ency of Life
metaData.links.id_Wiki = 'Myliobatis_aquila'; % Wikipedia
metaData.links.id_ADW = 'Myliobatis_aquila'; % ADW
metaData.links.id_Taxo = '42160'; % Taxonomicon
metaData.links.id_WoRMS = '105860'; % WoRMS
metaData.links.id_fishbase = 'Myliobatis-aquila'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Myliobatis_aquila}}';   
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
'howpublished = {\url{https://www.fishbase.se/summary/Myliobatis-aquila}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CapaGuel2007'; type = 'Article'; bib = [ ... 
'author = {C. Capap\''{e} and O. Gu\''{e}lorget and Y. Vergne and J.P. Quignard}, ' ...
'year = {2007}, ' ...
'title  = {Reproductive biology of the common eagle ray \emph{Myliobatis quila} ({C}hondrichthyes: {M}yliobatidae) from the coast of {L}anguedoc (southern {F}rance, northern {M}editerranean)}, ' ...
'journal = {Vie et Milieu-Life and Environment}, ' ...
'volume = {57(3)}, ' ...
'pages = {1-6}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

