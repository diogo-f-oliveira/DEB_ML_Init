  function [data, auxData, metaData, txtData, weights] = mydata_Parailia_pellucida
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Schilbeidae';
metaData.species    = 'Parailia_pellucida'; 
metaData.species_en = 'Glass schilbid'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnf'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 01 18];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 18];

%% set data
% zero-variate data
data.ab = 6.5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(27);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 5;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 12;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.5e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.66 mm of Schilbe mystus: pi/6*0.066^3';
data.Wwp = 0.83;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00550*Lp^3.12, see F1';
data.Wwi = 12.8;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'base on 0.00550*Li^3.12, see F1';
  
data.Ri = 1e4/365;       units.Ri = '#/d';  label.Ri = 'max reprod rate';     bibkey.Ri = 'guess';
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
318.732	4.756
365-7.711	5.347
365+24.419	5.472
365+46.910	5.596
365+97.676	6.249
365+142.016	6.497
365+167.720	6.528
365+194.067	6.746
365+222.342	6.839
365+257.042	6.933
730+258.327	9.202
730+287.245	9.140];
data.tL(:,1) = data.tL(:,1) + 20; % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
  temp.tL = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'UnekNwan2013';


%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 10;

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
F1 = 'length-weight: Ww in g = 0.00550*(TL in cm)^3.12'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4CX85'; % Cat of Life
metaData.links.id_ITIS = '639949'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Parailia_pellucida'; % Wikipedia
metaData.links.id_ADW = 'Parailia_pellucida'; % ADW
metaData.links.id_Taxo = '182757'; % Taxonomicon
metaData.links.id_WoRMS = '1469360'; % WoRMS
metaData.links.id_fishbase = 'Parailia-pellucida'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Parailia_pellucida}}';  
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
bibkey = 'UnekNwan2013'; type = 'Article'; bib = [ ...
'doi = {10.2478/v10043-011-0006-2}, ' ...
'author = {Bilikis Iyabo Uneke and Christopher Didiugwu Nwani and Okechukwu Okogwu and Florence Okoh}, ' ...
'year = {2013}, ' ...
'title = {Growth, mortality, recruitment and yield of \emph{Parailia pellucida} {B}oulenger, 1901 ({O}steichthyes: {S}chilbeidae) in a tropical flood river system, southeastern {N}igeria}, ' ... 
'journal = {Continental J. Biological Sciences}, ' ...
'volume = {6(3)}, '...
'pages = {43-52}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Parailia-pellucida.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

