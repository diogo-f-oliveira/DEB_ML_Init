function [data, auxData, metaData, txtData, weights] = mydata_Bombina_bombina

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Bombinatoridae';
metaData.species    = 'Bombina_bombina'; 
metaData.species_en = 'European fire-bellied toad'; 

metaData.ecoCode.climate = {'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiTs', 'jiTf', 'jiFp'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2017 10 30];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 10 30]; 

%% set data
% zero-variate data

data.ab = 7;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'KinnKune2006';   
  temp.ab = C2K(19);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 70;   units.tj = 'd';    label.tj = 'time since birth at metam';bibkey.tj = 'KinnKune2006';   
  temp.tj = C2K(24.5);  units.temp.tj = 'K'; label.temp.tj = 'temperature'; 
data.tp = 3*365; units.tp = 'd';    label.tp = 'time since metam at puberty'; bibkey.tp = 'KinnKune2006';
  temp.tp = C2K(14);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 20*365;units.am = 'd';    label.am = 'life span';                bibkey.am = 'KinnKune2006';   
  temp.am = C2K(14);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 0.7;  units.Lb  = 'cm';  label.Lb  = 'total length of tadpole at birth';  bibkey.Lb  = 'KinnKune2006'; 
data.Ljb  = 4.2; units.Ljb  = 'cm'; label.Ljb  = 'total length of tadpole at metam';  bibkey.Ljb  = 'KinnKune2006'; 
data.Lj  = 1.5;  units.Lj  = 'cm';  label.Lj  = 'SVL of frog at metam';    bibkey.Lj  = 'KinnKune2006'; 
data.Lp  = 4.0;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty'; bibkey.Lp  = 'KinnKune2006';
data.Li  = 5.2;  units.Li  = 'cm';  label.Li  = 'ultimate SVL';   bibkey.Li  = 'KinnKune2006';
  comment.Li = 'Wiki gives 6 cm';

data.Wwb = 1.7e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'KinnKune2006';
  comment.Wwb = 'based on egg diameter of 1.49 mm: pi/6*0.149^3';
data.Wwj = 0.18;   units.Wwj = 'g';   label.Wwp = 'wet weight at puberty'; bibkey.Wwj = {'KinnKune2006','Wiki'};
  comment.Wwj = 'based on (Lj/6)^3*Wwi';
data.Wwp = 4.1;   units.Wwp = 'g';   label.Wwj = 'wet weight at metam'; bibkey.Wwp = {'KinnKune2006','Wiki'};
  comment.Wwp = 'based on (Lp/6)^3*Wwi';
data.Wwi = 13.9; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'Wiki';

data.Ri  = 1000/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate at 4.5 cm SVL'; bibkey.Ri  = 'KinnKune2006';   
  temp.Ri  = C2K(14);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '186 - 1236 per season';
 
% uni-variate data
% time-length
data.tL = [ ... % time since hatch (d), total length (cm)
 0 0.7
 5 1.18
10 1.37
20 1.94
30 2.96
70 4.20]; % metam 
units.tL   = {'d', 'cm'};  label.tL = {'time since hatch', 'total length'};  
temp.tL    = C2K(24.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL  = 'KinnKune2006';
comment.tL = 'Data for tadpoles';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;


%% Discussion points
D1 = 'tadpoles are assumed to differ from frogs by del_M only';
D2 = 'males are assumed to not differ from females';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '5WNNB'; % Cat of Life
metaData.links.id_ITIS = '661625'; % ITIS
metaData.links.id_EoL = '333308'; % Ency of Life
metaData.links.id_Wiki = 'Bombina_bombina'; % Wikipedia
metaData.links.id_ADW = 'Bombina_bombina'; % ADW
metaData.links.id_Taxo = '47532'; % Taxonomicon
metaData.links.id_WoRMS = '1506624'; % WoRMS
metaData.links.id_amphweb = 'Bombina+bombina'; % AmphibiaWeb
metaData.links.id_AnAge= 'Bombina_bombina'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bombina_bombina}}';
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
bibkey = 'KinnKune2006'; type = 'Article'; bib = [ ... 
'author = {O. Kinne and J. Kunert and W. Zimmermann}, ' ... 
'year = {2006}, ' ...
'title = {Breeding, rearing and raising the red-bellied toad \emph{Bombina bombina} in the laboratory}, ' ...
'journal = {Endang Species Res}, ' ...
'volume = {1}, ' ...
'pages = {11-23}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
