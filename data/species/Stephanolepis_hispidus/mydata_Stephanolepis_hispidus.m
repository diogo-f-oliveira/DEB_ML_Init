function [data, auxData, metaData, txtData, weights] = mydata_Stephanolepis_hispidus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Tetraodontiformes'; 
metaData.family     = 'Monacanthidae';
metaData.species    = 'Stephanolepis_hispidus'; 
metaData.species_en = 'Planehead filefish'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MA'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'jiCie'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 12 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 12 28]; 

%% set data
% zero-variate data

data.am = 4 * 365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(21);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'Wiki gives 3 yr, but that seems small given tL data';

data.Lp  = 13.9;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
  comment.Lp = 'estimate, derived from other species';
data.Li  = 27.5;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'Wiki';

data.Wwb = 9.7e-7;  units.Wwb = 'g';   label.Wwb = 'wet weight at puberty';    bibkey.Wwb = 'MancCast2015';
  comment.Wwb = 'based on egg diameter of 0.47 mm : pi/6*0.057^3';
data.Wwp = 36.6;  units.Wwp = 'g';   label.Wwp = 'wet weight at birth';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01820*Lp^2.89, see F3';
data.Wwi = 263;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01820*Li^2.89, see F3';

data.Ri  = 91323/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri  = 'MancCast2015';   
  temp.Ri = C2K(21); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    0 10.9
    1 15.8
    2 19.4
    3 21.4];
data.tL(:,1) = 365 * (0.9 + data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(21);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MancCast2004';

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

%% Discussion points
D1 = '';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'reef-associated; depth range 0 - 293 m.   Subtropical';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Found on sand or mud bottoms. Associated with Sargassum. Adults feed on benthic invertebrates';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'length-weight: Ww in g = 0.01820*(TL in cm)^2.89';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '52CCX'; % Cat of Life
metaData.links.id_ITIS = '173183'; % ITIS
metaData.links.id_EoL = '46570755'; % Ency of Life
metaData.links.id_Wiki = 'Stephanolepis_hispidus'; % Wikipedia
metaData.links.id_ADW = 'Stephanolepis_hispidus'; % ADW
metaData.links.id_Taxo = '188197'; % Taxonomicon
metaData.links.id_WoRMS = '307126'; % WoRMS
metaData.links.id_fishbase = 'Stephanolepis-hispidus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Stephanolepis_hispidus}}';
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
bibkey = 'MancCast2004'; type = 'Article'; bib = [ ... 
'author = {N\''{e}stor Javier Mancera-Rodr\''{i}guez and Jos\''{e} Juan Castro-Hern\''{a}ndez}, ' ... 
'year = {2004}, ' ...
'title = {Age and growth of \emph{Stephanolepis hispidus} ({L}innaeus, 1766) ({P}isces: {M}onacanthidae), in the {C}anary {I}slands area}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {66}, ' ...
'pages = {381-386}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MancCast2015'; type = 'Article'; bib = [ ... 
'author = {N\''{e}stor Javier Mancera-Rodr\''{i}guez and Jos\''{e} Juan Castro-Hern\''{a}ndez}, ' ... 
'year = {2015}, ' ...
'title = {Reproductive biology of the planehead filefish \emph{Stephanolepis hispidus} ({P}isces: {M}onacanthidae), in the {C}anary {I}slands area}, ' ...
'journal = {Ichtyological research}, ' ...
'volume = {62}, ' ...
'pages = {258-267}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{hhttp://www.fishbase.se/summary/Stephanolepis-hispidus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
