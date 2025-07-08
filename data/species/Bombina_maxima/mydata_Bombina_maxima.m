function [data, auxData, metaData, txtData, weights] = mydata_Bombina_maxima

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Bombinatoridae';
metaData.species    = 'Bombina_maxima'; 
metaData.species_en = 'Large-webbed bell toad'; 

metaData.ecoCode.climate = {'Cfb','Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiTs', 'jiTf', 'jiFp'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2023 02 13];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 02 13];

%% set data
% zero-variate data

data.ab = 30;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(12);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 2*365;   units.tp = 'd';    label.tp = 'time since birth at puberty';bibkey.tp = 'guess';   
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 6*365;units.am = 'd';    label.am = 'life span';                bibkey.am = 'HuanQing2013';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lj  = 1.8;  units.Lj  = 'cm';  label.Lj  = 'SVL of frog at metam';    bibkey.Lj  = 'guess'; 
data.Lp  = 3.2;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty'; bibkey.Lp  = 'guess';
  comment.Lp = 'based on Bombina variegata';
data.Li  = 5.5; units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'HuanQing2013';
data.Lim  = 6;  units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'HuanQing2013';

data.Wwb = 1.7e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.49 mm of Bombina bombina: pi/6*0.149^3';
data.Wwi = 71.5; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Bombina orientalis: 5.5/5.1)^3*57';

data.Ri  = 300/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri  = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Bombina variegata';
 
% uni-variate data
% time-length
data.tL_fm = [ ... % time since metam (d), SVL (cm)
    2 4.84 5.31
    3 5.21 5.44
    4 5.40 5.80
    5 NaN  5.75
    6 NaN  5.99]; 
data.tL_fm(:,1) = (data.tL_fm(:,1) + 0.5) * 365; % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since metam', 'SVL'};  
temp.tL_fm   = C2K(20);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'HuanQing2013'; treat.tL_fm = {1, {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.ab = 0 * weights.ab;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;
weights.Lj = 3 * weights.Lj;

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
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '68NNF'; % Cat of Life
metaData.links.id_ITIS = '661628'; % ITIS
metaData.links.id_EoL = '1019289'; % Ency of Life
metaData.links.id_Wiki = 'Bombina_maxima'; % Wikipedia
metaData.links.id_ADW = 'Bombina_maxima'; % ADW
metaData.links.id_Taxo = '47533'; % Taxonomicon
metaData.links.id_WoRMS = '155900'; % WoRMS
metaData.links.id_amphweb = 'Bombina+maxima'; % AmphibiaWeb
metaData.links.id_AnAge= 'Bombina_orientalis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bombina_maxima}}';
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
bibkey = 'HuanQing2013'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jpn.12203}, ' ...
'author = {Yan Huang and Hong Qing Zhu and Yong Mei Liao and Long Jin and Wen Bo Liao}, ' ... 
'year = {2013}, ' ...
'title = {Age and body size of the toad Bombina maxima in a subtropical high-altitude population}, ' ...
'journal = {Herpetological Journal}, ' ...
'volume = {23}, ' ...
'pages = {229–232}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Bombina+maxima}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

