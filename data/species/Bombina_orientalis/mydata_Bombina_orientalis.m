function [data, auxData, metaData, txtData, weights] = mydata_Bombina_orientalis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Bombinatoridae';
metaData.species    = 'Bombina_orientalis'; 
metaData.species_en = 'Oriental fire-bellied toad'; 

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

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 02 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 02 04];

%% set data
% zero-variate data

data.ab = 60;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'amphibiaweb';   
  temp.ab = C2K(12);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 260;   units.tj = 'd';    label.tj = 'time since birth at metam';bibkey.tj = 'guess';   
  temp.tj = C2K(20);  units.temp.tj = 'K'; label.temp.tj = 'temperature'; 
data.am = 15.8*365;units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lj  = 1.8;  units.Lj  = 'cm';  label.Lj  = 'SVL of frog at metam';    bibkey.Lj  = 'MichAntw2014'; 
data.Lp  = 3.2;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty'; bibkey.Lp  = 'guess';
  comment.Lp = 'based on Bombina variegata';
data.Li  = 5.1;  units.Li  = 'cm';  label.Li  = 'ultimate SVL';   bibkey.Li  = 'Wiki';

data.Wwb = 1.7e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.49 mm of Bombina bombina: pi/6*0.149^3';
data.Wwi = 57; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'Wiki';
  comment.Wwi = '28–57 grams ';

data.Ri  = 2*148/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate'; bibkey.Ri  = 'amphibiaweb';   
  temp.Ri  = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '38-257 eggs per clutch, assumed: probably >1 clutch per season';
 
% uni-variate data
% time-length
data.tL = [ ... % time since metam (d), SVL (cm)
 0	1.83333
60	2.56746
120	2.73413
180	2.90476
240	3.46825]; 
units.tL   = {'d', 'cm'};  label.tL = {'time since metam', 'SVL'};  
temp.tL   = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MichAntw2014'; comment.tL = '22 C during day-time, 18 C at night under lab conditions';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;
weights.Lj = 3 * weights.Lj;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to not differ from females';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '68NNM'; % Cat of Life
metaData.links.id_ITIS = '661630'; % ITIS
metaData.links.id_EoL = '1039145'; % Ency of Life
metaData.links.id_Wiki = 'Bombina_orientalis'; % Wikipedia
metaData.links.id_ADW = 'Bombina_orientalis'; % ADW
metaData.links.id_Taxo = '47534'; % Taxonomicon
metaData.links.id_WoRMS = '155900'; % WoRMS
metaData.links.id_amphweb = 'Bombina+orientalis'; % AmphibiaWeb
metaData.links.id_AnAge= 'Bombina_orientalis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bombina_orientalis}}';
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
bibkey = 'MichAntw2014'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jpn.12203}, ' ...
'author = {C. J. Michaels and R. E. Antwis and R. F. Preziosi}, ' ... 
'year = {2014}, ' ...
'title = {Impacts of {U}{V}{B} provision and dietary calcium content on serum vitamin {D}3, growth rates, skeletal structure and coloration in captive oriental fire-bellied toads (\emph{Bombina orientalis})}, ' ...
'journal = {Journal of Animal Physiology and Animal Nutrition}, ' ...
'pages = {1-13}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Bombina+orientalis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Bombina_orientalis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
