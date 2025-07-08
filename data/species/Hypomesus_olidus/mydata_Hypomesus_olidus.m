  function [data, auxData, metaData, txtData, weights] = mydata_Hypomesus_nipponensis

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Osmeriformes'; 
metaData.family     = 'Osmeridae';
metaData.species    = 'Hypomesus_olidus'; 
metaData.species_en = 'Pond smelt';

metaData.ecoCode.climate = {'ME','MC','Dfb'};
metaData.ecoCode.ecozone = {'MPNW','TH','MN'};
metaData.ecoCode.habitat = {'0jFr', '0jFl', 'jiMcp'};
metaData.ecoCode.embryo  = {'Fs', 'Fg', 'Fh'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz', 'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 08 20];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 20];

%% set data
% zero-variate data
data.am = 10*365;  units.am = 'd';   label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(10); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 10;   units.Lp = 'cm';  label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase'; 
data.Li = 20;   units.Li = 'cm';  label.Li = 'ultimate total length';    bibkey.Li = 'fishbase';

data.Wwb = 2.2e-4;   units.Wwb = 'cm';  label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.6 to 0.9 mm for Osmerus mordax: pi/6*0.075^3';
data.Wwp = 6.3;   units.Wwp = 'cm';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00398*Lp^3.20, see F1';
data.Wwi = 58;   units.Wwi = 'cm';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00398*Li^3.20, see F1';

data.Ri = 4000/365; units.Ri = '#/d'; label.Ri = 'maximum reprod rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(10);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri= 'temps are guessed';
    
% uni-variate data

% time - length
data.tL = [ ... % time since birth (yr), fork length (cm)
    1 2.62
    2 4.24
    3 5.10
    4 5.97
    5 6.08
    8 8.00
    9 9.20];
data.tL(:,1) = (0.5+data.tL(:,1)) * 365; % convert yr to d; origin is 1 May 
data.tL(:,2) = 1.08*data.tL(:,2); % convert FL to TL, see F2
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(10); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = {'DeGr1985'};

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL','tL1'}; subtitle1 = {'Data for 2 varying food levels'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

% %% Discussion points
% D1 = '';
% metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00398*(TL in cm)^3.20';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-lenfh from photo: TL = 1.08*FL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);
                                 
%% Links
metaData.links.id_CoL = '3NXDB'; % Cat of Life
metaData.links.id_ITIS = '162031'; % ITIS
metaData.links.id_EoL = '46563010'; % Ency of Life
metaData.links.id_Wiki = 'Hypomesus_olidus'; % Wikipedia
metaData.links.id_ADW = 'Hypomesus_olidus'; % ADW
metaData.links.id_Taxo = '177138'; % Taxonomicon
metaData.links.id_WoRMS = '254556'; % WoRMS
metaData.links.id_fishbase = 'Hypomesus-olidus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Hypomesus_olidus}}';  
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
bibkey = 'DeGr1985'; type = 'Article'; bib = [ ...  
'author = {DeGraaf, Dirk. A.}, ' ...
'year = {1985}, ' ...
'title = {Aspects of the life history of the pond smelt (\emph{Hypomesus olidus}) in the {Y}ukon and {N}orthwest {T}erritories}, ' ... 
'journal = {Arctic}, ' ...
'volume = {39(3)}, '...
'pages = {260-263}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Hypomesus-olidus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
