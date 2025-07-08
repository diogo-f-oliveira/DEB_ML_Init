function [data, auxData, metaData, txtData, weights] = mydata_Atherina_presbyter

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Atheriniformes'; 
metaData.family     = 'Atherinidae';
metaData.species    = 'Atherina_presbyter'; 
metaData.species_en = 'Sand smelt'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Fc', 'Fh'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2014 05 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 08 25]; 

%% set data
% zero-variate data

data.ab = 26;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'PalmCull2006';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 365;     units.ap = 'd';    label.ap = 'age at puberty';            bibkey.ap = 'TurnBamb1981';
  temp.ap = C2K(16.5); units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'for females';
data.am = 5*365;   units.am = 'd';    label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(12);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.696;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'PalmCull2006';  
data.Lp  = 6.8;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'PajuLore2000'; 
data.Li  = 21;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'eol';

data.Wwb = 2.2e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'PajuLore2000';
  comment.Wwb = 'computed as 0.006542 * Lb^3.04922';
data.Wwp = 2.26;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'PajuLore2000';
  comment.Wwp = 'computed as Wp = 0.006542 * Lp^3.04922';
data.Wwi = 70.4;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'PajuLore2000';
  comment.Wwi = 'computed as Wi = 0.006542 * Li^3.04922';

data.Ri = 6900/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'TurnBamb1981';   
  temp.Ri = C2K(12); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... time since hatch (month), length (cm)
 1 2.4
 2 3.0
 3 4.25
 4 6.0
 5 6.5
 6 7.5
 7 8.0
 8 8.7
 9 9.0
10 9.5
11 9.5
12 10.0
13 10.0
14 9.5
15 10.5];
data.tL(:,1) = data.tL(:,1) * 30.5; % convert month to dunits.
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'}; 
temp.tL    = C2K(15);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MoreMora2003'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 50;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'W = 0.006536 * L^3.04102 (males), 0.006542 * L^3.04922 (females)';
metaData.bibkey.F1 = 'PajuLore2000'; 
F2 = 'Most female sand-smelts (73%) matured at the end of their first year of life, fecundities ranging on average from 1394 eggs per female for 1+ group fish to 6872 for III+ fish.';
metaData.bibkey.F2 = 'TurnBamb1981'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '5VWXW'; % Cat of Life
metaData.links.id_ITIS = '166025'; % ITIS
metaData.links.id_EoL = '46566598'; % Ency of Life
metaData.links.id_Wiki = 'Atherina_presbyter'; % Wikipedia
metaData.links.id_ADW = 'Atherina_presbyter'; % ADW
metaData.links.id_Taxo = '44697'; % Taxonomicon
metaData.links.id_WoRMS = '272030'; % WoRMS
metaData.links.id_fishbase = 'Atherina-presbyter'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{https://en.wikipedia.org/wiki/Sand_smelt}}'];
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
bibkey = 'PajuLore2000'; type = 'Article'; bib = [ ... 
'author = {J. G. Pajuelo and J. M. Lorenzo}, ' ... 
'year = {2000}, ' ...
'title = {Biology of the sand smelt, \emph{Atherina presbyter} ({T}eleostei: {A}therinidae), off the {C}anary {I}slands (central-east {A}tlantic)}, ' ...
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {59}, ' ...
'pages = {91-97}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PalmCull2006'; type = 'Article'; bib = [ ... 
'author = {C. J. Palmer and M. B. Culley}, ' ... 
'year = {2006}, ' ...
'title = {The egg and early life stages of the sandsmelt, \emph{Atherina presbyter} {C}uvier}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {24}, ' ...
'pages = {537-544}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TurnBamb1981'; type = 'Article'; bib = [ ... 
'author = {A. W. H. Turnpenny and R. N. Bamber and P. A. Henderson}, ' ... 
'year = {1981}, ' ...
'title = {Biology of the sand-smelt (\emph{Atherina presbyter} {V}alenciennes) around {F}awley power station.}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {18}, ' ...
'pages = {417-427}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MoreMora2003'; type = 'Article'; bib = [ ... 
'author = {T. Moreno and B. Morales-Nin }, ' ... 
'year = {2003}, ' ...
'title = {Age determination and validation on otoliths of the sand-smelt \emph{Atherina presbyter} ({C}uvier, 1829) ({P}isces: {A}therinidae) from the central-east {A}tlantic}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {62}, ' ...
'pages = {77-87}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'eol'; type = 'Misc'; bib = [...
'howpublished = {\url{http://eol.org/pages/340190/overview}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [...
'howpublished = {\url{http://www.fishbase.org/summary/45}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

