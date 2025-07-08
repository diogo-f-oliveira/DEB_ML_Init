function [data, auxData, metaData, txtData, weights] = mydata_Crystallogobius_linearis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Deltentosteus_quadrimaculatus'; 
metaData.species_en = 'Four-spotted goby'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE','MAm'};
metaData.ecoCode.habitat = {'0jFe', 'jiMp'};
metaData.ecoCode.embryo  = {'Mc'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 25];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 25];

%% set data
% zero-variate data

data.ab = 12;   units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(15.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 6*365;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'MetiIlky2011';   
  temp.am = C2K(15.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 6.2;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 10.3;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 2.771e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length 1.08 mm, width 0.7 mm of Pomatoschistus minutus: pi/6*0.108*0.07^2';
data.Wwp = 1.94;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00692*Lp^3.09, see F1';
data.Wwi = 9.33;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'fishbase';
  comment.Wwp = 'based on 0.00692*Li^3.09, see F1';

data.Ri  = 1700/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(15.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Rhinogobius brunneus';

% uni-variate data

% time-length
data.tL = [... %  time since birth (yr), total length (cm)
    1 4.40
    2 6.27
    3 7.47
    4 8.26
    5 8.98];
data.tL(:,1) = (0.4+data.tL(:,1))*365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(15.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MetiIlky2011'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {''}; subtitle1 = {''};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: weight in g = 0.00692*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'FD6P'; % Cat of Life
metaData.links.id_ITIS = '172033'; % ITIS
metaData.links.id_EoL = '46575170'; % Ency of Life
metaData.links.id_Wiki = 'Deltentosteus_quadrimaculatus'; % Wikipedia
metaData.links.id_ADW = 'Deltentosteus_quadrimaculatus'; % ADW
metaData.links.id_Taxo = '46558'; % Taxonomicon
metaData.links.id_WoRMS = '126868'; % WoRMS
metaData.links.id_fishbase = 'Deltentosteus-quadrimaculatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Deltentosteus_quadrimaculatus}}';
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
bibkey = 'MetiIlky2011'; type = 'Article'; bib = [ ... 
'doi = {10.3906/zoo-1001-32}, '...
'author = {G\"{u}lnur Met\''{i}n and Akın T\"{u}rker Ilkyaz and Ozan Soykan and Hasan Tuncay Kinacigil}, ' ... 
'year = {2011}, ' ...
'title = {Age, growth and reproduction of four-spotted goby, \emph{Deltentosteus quadrimaculatus} ({V}alenciennes, 1837), in {I}zmir {B}ay (central {A}egean {S}ea)}, ' ...
'journal = {Turk J. Zool.}, ' ...
'volume = {35(5)}, ' ...
'pages = {711-716}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [ ...
'author = {Anonymous}, ' ...
'year = {2015}, ' ...
'howpublished = {\url{https://www.fishbase.de/summary/Deltentosteus-quadrimaculatus.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
