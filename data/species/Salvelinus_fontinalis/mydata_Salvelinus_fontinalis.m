  function [data, auxData, metaData, txtData, weights] = mydata_Salvelinus_fontinalis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Salvelinus_fontinalis'; 
metaData.species_en = 'Brook trout'; 

metaData.ecoCode.climate = {'Dfa','Dfb','Dfc','MC'};
metaData.ecoCode.ecozone = {'THn', 'MANE'};
metaData.ecoCode.habitat = {'0iFr', 'jiMpe'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda','Mp'};
metaData.ecoCode.food    = {'biCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 07 15];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 15]; 

%% set data
% zero-variate data
data.am = 24*365;  units.am = 'd';   label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(5); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 15;     units.Lp = 'cm';  label.Lp = 'total length at puberty';bibkey.Lp = 'OhluNord2008'; 
  comment.Lp = 'based on tp = 3 yrs';
data.Li = 86;    units.Li = 'cm';  label.Li = 'ultimate standard length';  bibkey.Li = 'fishbase';

data.Wwb = 2.76e-2; units.Wwb = 'g';   label.Wwb = 'wet weight at hatch';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 3.75 mm for Salvelinus_malma: pi/6*0.375^3';
data.Wwp = 33.24;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'OhluNord2008','fishbase'};
  comment.Wwp = 'based on  0.00933*Lp^3.02, see F1';
data.Wwi = 6.48e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on  0.00933*Li^3.02, see F1';
  
data.Ri = 5000/365; units.Ri = '#/d'; label.Ri = 'maximum reprod rate';   bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    
% uni-variate data
% time-length
data.tL = [... % time since birth (yr), total length (cm)
0.497	6.197
1.496	11.681
2.482	14.802
3.491	17.651
4.475	18.953];
data.tL(:,1) = 365 * (0.75 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(5); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'OhluNord2008';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'temperatures are guessed; known as a cold-water species';
metaData.discussion = struct('D1', D1);
    
%% Facts
F1 = 'length-weight: Ww in g = 0.00933*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6XG35'; % Cat of Life
metaData.links.id_ITIS = '162003'; % ITIS
metaData.links.id_EoL = '46563151'; % Ency of Life
metaData.links.id_Wiki = 'Salvelinus_fontinalis'; % Wikipedia
metaData.links.id_ADW = 'Salvelinus_fontinalis'; % ADW
metaData.links.id_Taxo = '42835'; % Taxonomicon
metaData.links.id_WoRMS = '154241'; % WoRMS
metaData.links.id_fishbase = 'Salvelinus-fontinalis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Salvelinus_fontinalis}}';  
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
bibkey = 'OhluNord2008'; type = 'Article'; bib = [ ...  
'doi = {10.1139/F08-003}, ' ...
'author = {Gunnar \"{O}hlund and Fredrik Nordwall and Erik Degerman and Torleif Eriksson}, ' ...
'year = {2008}, ' ...
'title = {Life history and large-scale habitat use of brown trout (\emph{Salmo trutta}) and brook trout (\emph{Salvelinus fontinalis}) -- implications for species replacement patterns}, ' ... 
'journal = {Can. J. Fish. Aquat. Sci}, ' ...
'volume = {65}, '...
'pages = {633-644}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Salvelinus-fontinalis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
