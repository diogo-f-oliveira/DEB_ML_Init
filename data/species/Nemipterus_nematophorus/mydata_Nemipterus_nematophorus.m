  function [data, auxData, metaData, txtData, weights] = mydata_Nemipterus_nematophorus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Nemipteridae';
metaData.species    = 'Nemipterus_nematophorus'; 
metaData.species_en = 'Doublewhip threadfin bream'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPW'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 01 05];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 05];

%% set data

% zero-variate data

data.am = 8*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(28.7); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 9.6;    units.Lp = 'cm'; label.Lp = 'std length at puberty'; bibkey.Lp = 'PaulPrad2016'; 
data.Li = 20;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of  1 mm: pi/6*0.1^3';
data.Wwp = 11.4;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'PaulPrad2016','fishbase'};
  comment.Wwp = 'based on 0.01380*Lp^2.97, see F1';
data.Wwi = 98; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01380*Li^2.96, see F1';
    
data.Ri  =  6662/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'UtamPers2018';   
  temp.Ri = C2K(28.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'data for Nemipterus furcosus';

% univariate data

% time-length
data.tL = [ ... % time since birth (mnth), total length (cm)
206.472	10.758
302.362	12.193
343.347	12.398
390.519	12.807
424.544	13.627
452.383	14.037
506.515	14.242
573.019	14.549];
data.tL(:,1) = data.tL(:,1) + 220; % convert mnth to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(28.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'InglPaul1984';

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
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: weight (in g) = 0.01380*(TL in cm)^2.96';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '467ZV'; % Cat of Life
metaData.links.id_ITIS = '168996'; % ITIS
metaData.links.id_EoL = '46581031'; % Ency of Life
metaData.links.id_Wiki = 'Nemipterus_nematophorus'; % Wikipedia
metaData.links.id_ADW = 'Nemipterus_nematophorus'; % ADW
metaData.links.id_Taxo = '180977'; % Taxonomicon46581352
metaData.links.id_WoRMS = '278128'; % WoRMS
metaData.links.id_fishbase = 'Nemipterus-nematophorus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Nemipterus_nematophorus}}';  
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
bibkey = 'InglPaul1984'; type = 'techreport'; bib = [ ... 
'author = {Ingles, J. and D. Pauly}, ' ... 
'year = {1984}, ' ...
'title = {An atlas of the growth, mortality and recruitment of {P}hilippines fishes}, ' ...
'institution = {ICLARM, International Center for Living Aquatic Resources Management, Manila, Philippines}, ' ...
'volume = {Tech. Rep. 13.}, '...
'pages = {127 p.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PaulPrad2016'; type = 'techreport'; bib = [ ... 
'doi = {10.18551/rjoas.2016-11.19}, ' ...
'author = {Mithun Paul and Siriporn Pradit and Sukree Hajisamae and Permsak Perngmak and Sazedul Hoque}, ' ... 
'year = {2016}, ' ...
'title = {SIZE AND GROWTH VARIATION AT MATURITY OF SIX \emph{Nemipterus} SPECIES IN THE SOUTH {C}HINA {S}EA}, ' ...
'journal = {RJOAS}, ' ...
'volume = {11(59)}, '...
'pages = {156-164}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'UtamPers2018'; type = 'misc'; bib = [ ... 
'doi = {10.1088/1755-1315/137/1/012021}, ' ...
'author = {E Utami and E Safitriyani and Leo Gatra Persada}, ' ... 
'year = {2018}, ' ...
'title = {The fecundity of fork-tailed threadfin bream (\emph{Nemipterus furcosus}) in Bangka, Bangka Belitung}, ' ...
'journal = {Earth and Environmental Science}, ' ...
'volume = {137}, '...
'pages = {1-4}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Nemipterus-nematophorus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
