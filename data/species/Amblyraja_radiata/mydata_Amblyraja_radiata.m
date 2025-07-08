function [data, auxData, metaData, txtData, weights] = mydata_Amblyraja_radiata

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Rajidae';
metaData.species    = 'Amblyraja_radiata'; 
metaData.species_en = 'Thorny skate'; 

metaData.ecoCode.climate = {'MC','ME'};
metaData.ecoCode.ecozone = {'MAg'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(8); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 29];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 10 29]; 

%% set data
% zero-variate data;
data.ab = 11*30.5; units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(8);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 16*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'SuliKnee2005';   
  temp.am = C2K(8); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 10; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'fishbase';
  comment.Lb = 'TL 8-12 cm';
data.Lp  = 87.5; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 105;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Wiki';

data.Wwi = 11.4e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';

data.Ri  = 22/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '10-45 eggs per yr';
  
% uni-variate data at f
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
    3  37
    4  42
    5  49
    6  54
    7  62
    8  73
    9  78
   10  82
   11  89
   12  92
   13  95
   14  98
   15 101
   16 105];
data.tL_f(:,1) = 365 * (0 + data.tL_f(:,1)); % convert yr to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
  temp.tL_f = C2K(8); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'SuliKnee2005';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
    2  33
    3  37
    4  43
    5  48
    6  64
    7  69
    8  71
    9  78
   10  86
   11  88
   12  93
   13  99
   14  97
   15 102
   16 101];
data.tL_m(:,1) = 365 * (0 + data.tL_m(:,1)); % convert yr to d
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
  temp.tL_m = C2K(8); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'SuliKnee2005';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 10 * weights.Li;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 3 * weights.psd.p_M;

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
D1 = 'males are assumed not to differ from females';
D2 = 'Temperatures are guessed; eurybathic, eurythermic';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00275 * (TL in cm)^3.25';
metaData.bibkey.F1 = 'fishbase';
F2 = 'ovoparous';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '65ZNH'; % Cat of Life
metaData.links.id_ITIS = '564149'; % ITIS
metaData.links.id_EoL = '46560459'; % Ency of Life
metaData.links.id_Wiki = 'Amblyraja_radiata'; % Wikipedia
metaData.links.id_ADW = 'Amblyraja_radiata'; % ADW
metaData.links.id_Taxo = '108253'; % Taxonomicon
metaData.links.id_WoRMS = '105865'; % WoRMS
metaData.links.id_fishbase = 'Amblyraja-radiata'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Amblyraja_radiata}}'; 
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
bibkey = 'SuliKnee2005'; type = 'Article'; bib = [ ...  
'author = {Sulikowski, James A. and Kneebone, Jeff and Elzey, Scott and Jurek, Joe and Danley, Patrick D. and Howell, William Huntting and Tsang, Paul C.W.}, ' ...
'year = {2005}, ' ...
'title  = {Age and growth estimates of the thorny skate (\emph{Amblyraja radiata}) in the western {G}ulf of {M}aine}, ' ...
'journal = {Fishery Bulletin}, ' ...
'volume = {4}, ' ...
'howpublished = {\url{https://scholars.unh.edu/biosci_facpub/4}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Amblyraja-radiata.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  