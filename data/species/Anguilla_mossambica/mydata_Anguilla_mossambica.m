  function [data, auxData, metaData, txtData, weights] = mydata_Anguilla_mossambica
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Anguilliformes'; 
metaData.family     = 'Anguillidae';
metaData.species    = 'Anguilla_mossambica'; 
metaData.species_en = 'African longfin eel'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIW'};
metaData.ecoCode.habitat = {'0jMpe', 'jpFl', 'jpFp', 'jpFr', 'piMd'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'};

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 11 07];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 07];

%% set data
% zero-variate data
data.am = 20*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(26.4); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 30;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'guess';
data.Li = 150;    units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 5.3e-4; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm for Anguila anguilla: pi/6*0.1^3';
data.Wwi = 8.2e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00089*Li^3.20, see F1;max. published weight: 5.7 kg';
  
data.Ri = 1.4e6/(6*365);  units.Ri = '#/d';  label.Ri = 'maximum reprod rate';    bibkey.Ri = 'guess';   
  temp.Ri = C2K(26.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Anguila anguilla';

% uni-variate data
data.tL = [ ... % age (yr), length (cm)
1	9.820
3	22.691
4	26.453
5	30.214
6	34.867
7	37.381
8	41.140
9	42.407
10	52.763
11	65.614
12	63.317
13	66.187
14	69.057
16	71.054
17	89.785];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL = {'d', 'cm'};   label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(26.4); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'McewHech1984';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Wwi = 5 * weights.Wwi;
weights.Wwb = 5 * weights.Wwb;
weights.Ri = 5 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures were guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00089*(TL in cm)^3.20';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '66R6N'; % Cat of Life
metaData.links.id_ITIS = '635477'; % ITIS
metaData.links.id_EoL = '46561254'; % Ency of Life
metaData.links.id_Wiki = 'Anguilla_mossambica'; % Wikipedia
metaData.links.id_ADW = 'Anguilla_mossambica'; % ADW
metaData.links.id_Taxo = '160967'; % Taxonomicon
metaData.links.id_WoRMS = '217458'; % WoRMS
metaData.links.id_fishbase = 'Anguilla-mossambica'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Anguilla_mossambica}}';  
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
bibkey = 'McewHech1984'; type = 'Article'; bib = [ ...  
'doi = {10.1080/02541858.1984.11447894}, ' ...
'author = {A. Mcewan and  T. Hecht}, ' ...
'year = {1984}, ' ...
'title = {Age and growth of the longfin eel, \emph{Anguilla mossambica} {P}eters, 1852 ({P}isces: {A}nguillidae) in {T}ranskei rivers}, ' ... 
'journal = {South African Journal of Zoology}, ' ...
'volume = {19(4)}, '...
'pages = {280-285}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
 bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Anguilla-mossambica.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


