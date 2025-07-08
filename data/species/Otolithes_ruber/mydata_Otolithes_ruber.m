function [data, auxData, metaData, txtData, weights] = mydata_Otolithes_ruber
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Otolithes_ruber'; 
metaData.species_en = 'Tigertooth croaker'; 

metaData.ecoCode.climate = {'A','MA'};
metaData.ecoCode.ecozone = {'TPi','MI','MPSW'};
metaData.ecoCode.habitat = {'0jFl', 'jiFr', 'piMc'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 012 03];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 03];

%% set data
% zero-variate data

data.am = 8*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'AlHaMoha2022';   
  temp.am = C2K(28.3); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 19.7;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'fishbase'; 
data.Li  = 90;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 2.6e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at puberty';  bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.79 mm: pi/6*0.079^3';
  comment.Wwb = 'based on Otolithoides biauritus';
data.Wwp = 80;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00851*Lp^3.07, see F1';
data.Wwi = 8.5e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00851*Li^3.07, see F1';

data.Ri = 422100/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate';  bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(28.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time - length
data.tL = [ ... % time since birth (yr), total length (cm)
    1 17.6
    2 26.8
    3 34.4
    4 40.6
    5 44.9
    6 53.1
    7 56.6
    8 59.1];
data.tL(:,1) = (data.tL(:,1)+0.3)*365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(28.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'AlHaMoha2022';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: W in g = 0.00851*(TL in cm)^3.07'; 
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = '4B7FH'; % Cat of Life
metaData.links.id_ITIS = '646658'; % ITIS
metaData.links.id_EoL = '46579087'; % Ency of Life
metaData.links.id_Wiki = 'Otolithes_ruber'; % Wikipedia
metaData.links.id_ADW = 'Otolithes_ruber'; % ADW
metaData.links.id_Taxo = '182362'; % Taxonomicon
metaData.links.id_WoRMS = '218641'; % WoRMS
metaData.links.id_fishbase = 'Otolithes-ruber'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Otolithes_ruber}}';
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
bibkey = 'AlHaMoha2022'; type = 'article'; bib = [ ... 
'author = {Al-Hassani, A.H. and A.R.M. Mohamedn}, ' ... 
'year = {2022}, ' ...
'title = {Some biological aspects of four marine fish species in {I}raqi marine waters, northwest {A}rabian {G}ulf}, ' ...
'journal = {Journal of Applied and Natural Science}, ' ...
'volume = {14(3)}, ' ...
'pages = {1051-1061}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Otolithes-ruber.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

