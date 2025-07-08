function [data, auxData, metaData, txtData, weights] = mydata_Rastrelliger_brachysoma

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Scombridae';
metaData.species    = 'Rastrelliger_brachysoma'; 
metaData.species_en = 'Short mackerel'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 05 05];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 05];

%% set data
% zero-variate data
data.ab = 2.7;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(27.2); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 2*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(27.2); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 17.3; units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase';
data.Li = 34.5;   units.Li = 'cm'; label.Li = 'ultimate total length';   bibkey.Li = 'fishbase';

data.Wwb = 4.5e-4; units.Wwb = 'g';    label.Wwb = 'dry weight at birth';    bibkey.Wwb = 'RenjSanj2017';
  comment.Wwb = 'based on egg diameter of  0.91 to 0.98 mm of Rastrelliger_kanagurta: pi/6*0.095^3';
data.Wwi = 485; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00955*Li^3.06, see F1';

data.Ri  = 37000/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'fishbase';  
  temp.Ri = C2K(27.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), total length (cm)
93.010	11.190
123.369	13.465
150.260	14.903
181.644	16.520
211.294	17.719
244.704	18.141
274.543	18.293
305.206	18.894
334.102	19.255
363.957	19.318];
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'}; 
temp.tL = C2K(27.2); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SucoTant1970';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00955*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4RLTD'; % Cat of Life
metaData.links.id_ITIS = '172463'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Rastrelliger_brachysoma'; % Wikipedia
metaData.links.id_ADW = 'Rastrelliger_brachysoma'; % ADW
metaData.links.id_Taxo = '46687'; % Taxonomicon
metaData.links.id_WoRMS = '273807'; % WoRMS
metaData.links.id_fishbase = 'Rastrelliger-brachysoma'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Rastrelliger_brachysoma}}';  
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
bibkey = 'SucoTant1970'; type = 'incollection'; bib = [ ... 
'doi = {10.1515/9780824885830-047}, ' ...
'author = {Prakorp Sucondhamarn and Chujit Tantisawetrat and Usa Sriruangcheep}, ' ...
'year = {1970}, ' ...
'title = {Estimation of Age and Growth of Chub Mackerel, \emph{Rastrelliger neglectus} (van {K}ampen), in the Western {G}ulf of {T}hailand}, ' ... 
'booktitle = {The Kuroshio: A Symposium on the Japanese Current}, ' ...
'publisher = {East West Center Press, Honolulu}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RenjSanj2017'; type = 'article'; bib = [ ... 
'doi = {10.6024/jmbai.2016.58.2.1958A-11}, ' ...
'author = {G. Sree Renjima and V. N. Sanjeevan and B. R. Smitha and C. B. Lalithambika Devi and M. Sudhakar}, ' ...
'year = {2017}, ' ...
'title = {Early developmental stages of the {I}ndian mackerel \emph{Rastrelliger kanagurta} ({C}uvier) along the {K}erala - {M}angalore coast of southeastern {A}rabian {S}ea}, ' ... 
'journal = {J. Mar. Biol. Ass. India}, ' ...
'volume = {58(2)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Rastrelliger-brachysoma.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
