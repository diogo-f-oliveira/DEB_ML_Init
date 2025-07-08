  function [data, auxData, metaData, txtData, weights] = mydata_Clupeonella_grimmi
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Ehiravidae';
metaData.species    = 'Clupeonella_grimmi'; 
metaData.species_en = 'Southern Caspian sprat'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'piMpe', '0jFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 20];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 20];

%% set data
% zero-variate data
data.ab = 3; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(28.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(28.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 8.8;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 14.5;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.7e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 5.04;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00724*Lp^3.01, see F1';
data.Wwi = 22.67;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00724*Li^3.01, see F1';

data.GSI = 0.3; units.GSI = 'g/g';  label.GSI = 'gonado somatic index for female';   bibkey.GSI = 'AliaPara2013';
  temp.GSI = C2K(28.5);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'Spawns throught the year: GSI peaks at 0.1. Assumed 3 spawns per yr';

% uni-variate data
% time-length
data.tL_fm = [ ... % time since hatch (d), fork length (cm)
    2  9.1   9.0
    3 10.4  10.55
    4 11.45 11.08
    5 12.58 12.03
    6 13.0  12.80
    7 13.49 NaN];
data.tL_fm(:,1) = 365 * (data.tL_fm(:,1) + 0.8);
units.tL_fm = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
  temp.tL_fm = C2K(28.5);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature'; 
  treat.tL_fm = {1,{'female','male'}};
bibkey.tL_fm = {'JanbFazl2016'};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = weights.tL_fm * 10;

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
D1 = 'males are assumed differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00724*(TL in cm)^3.01'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'WCX2'; % Cat of Life
metaData.links.id_ITIS = '551221'; % ITIS
metaData.links.id_EoL = '46562395'; % Ency of Life
metaData.links.id_Wiki = 'Clupeonella_grimmi'; % Wikipedia
metaData.links.id_ADW = 'Clupeonella_grimmi'; % ADW
metaData.links.id_Taxo = '171481'; % Taxonomicon
metaData.links.id_WoRMS = '272259'; % WoRMS
metaData.links.id_fishbase = 'Clupeonella-grimmi'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Clupeonella_grimmi}}';  
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
bibkey = 'JanbFazl2016'; type = 'Article'; bib = [ ... 
'author = {Janbaz, A.A. and Fazli, H. and Pourgholam, R. and Kaymaram, F. and Khedmati, K. and Parafkandeh, F. and Afraei Bandpei, M.A.}, ' ...
'year = {2016}, ' ...
'title = {Age and growth of bigeye kilka (\emph{Clupeonella grimmi} {K}essler, 1877) in {I}ranian waters of the {C}aspian {S}ea}, ' ... 
'journal = {Iranian Journal of Fisheries Sciences}, ' ...
'volume = {15(4)}, '...
'pages = {1410-1424}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AliaPara2013'; type = 'Article'; bib = [ ... 
'author = {Aliasghari, M. and Parafkandeh, Haghighi F.}, ' ...
'year = {2013}, ' ...
'title = {A comparative study on reproduction of kilka species ({C}lupeidae) in southeastern parts of the {C}aspian {S}ea}, ' ... 
'journal = {Iranian Journal of Fisheries Sciences}, ' ...
'volume = {12(3)}, '...
'pages = {522-532}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Clupeonella-grimmi.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  