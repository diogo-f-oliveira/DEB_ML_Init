function [data, auxData, metaData, txtData, weights] = mydata_Raja_microocellata

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Rajidae';
metaData.species    = 'Raja_microocellata'; 
metaData.species_en = 'Smalleyed ray'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MASE'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 11 05];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 11 05]; 

%% set data
% zero-variate data;
data.ab = 214.2; units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'Hume2019';   
  temp.ab = C2K(12); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 18*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'RylaAjay1984';   
  temp.am = C2K(12); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 15;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'Hume2019';
data.Lp  = 73;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';   bibkey.Lp  = 'fishbase';
data.Li  = 137; units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'RylaAjay1984';

data.Wwi = 52.6e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00468*Li^3.3, see F1; fishbase reports max published weight 4.5 kg';

data.Ri  = 57/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'RylaAjay1984';   
  temp.Ri = C2K(12); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '54-61 eggs per yr';

% uni-variate data at f
data.tL = [ ... % time since birth (yr), total length (cm)
    0 39.0
    1 40.5
    2 47.4
    3 54.0
    4 61.1
    5 68.9
    6 74.1
    7 79.0
    8 83.7
    9 87.5];
data.tL(:,1) = 365 * (0.95 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(12); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'RylaAjay1984';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females, due to lack of data (females become larger, but possibly through longer life span)';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00468*(PL in cm)^3.3';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '78RLX'; % Cat of Life
metaData.links.id_ITIS = '160882'; % ITIS
metaData.links.id_EoL = '46560549'; % Ency of Life
metaData.links.id_Wiki = 'Raja_microocellata'; % Wikipedia
metaData.links.id_ADW = 'Raja_microocellata'; % ADW
metaData.links.id_Taxo = '42070'; % Taxonomicon
metaData.links.id_WoRMS = '105885'; % WoRMS
metaData.links.id_fishbase = 'Raja-microocellata'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Raja_microocellata}}'; 
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
bibkey = 'RylaAjay1984'; type = 'Article'; bib = [ ... 
'author = {J. S. Ryland and T. O. Ajayi}, ' ...
'year = {1984}, ' ...
'title  = {Growth and population dynamics of three \emph{Raja} species ({B}atoidei) in {C}armarthen {B}ay, {B}ritish {I}sles}, ' ...
'journal = {J. Cons. int. Explor. Mer.}, ' ...
'volume = {41}, ' ...
'pages = {l1l-120}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hume2019'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jfb.13997}, ' ...
'author = {John B. Hume}, ' ...
'year = {2019}, ' ...
'title  = {Higher temperatures increase developmental rate and reduce body size at hatching in the small-eyed skate \emph{Raja microocellata}: implications for exploitation of an elasmobranch in warming seas}, ' ...
'journal = {J Fish Biol.}, ' ...
'volume = {95}, ' ...
'pages = {655-658}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Raja-microocellata.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

