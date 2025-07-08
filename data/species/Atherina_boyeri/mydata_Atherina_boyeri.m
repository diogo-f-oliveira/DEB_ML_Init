function [data, auxData, metaData, txtData, weights] = mydata_Atherina_boyeri

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Atheriniformes'; 
metaData.family     = 'Atherinidae';
metaData.species    = 'Atherina_boyeri'; 
metaData.species_en = 'Big-scale sand smelt'; 
metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Fc', 'Fh'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(18.3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 02 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 02 10]; 

%% set data
% zero-variate data

data.am = 4*365;   units.am = 'd';    label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(18.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 20;  units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.8e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'DulcGrub2008';
  comment.Wwb = 'based on egg diameter of 1.75 mm: pi/6*0.175^3';
data.Wwp = 0.79;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'PajuLore2000';
  comment.Wwp = 'based on 0.00562*Li^3.07, see F1';
data.Wwi = 55.4;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'PajuLore2000';
  comment.Wwi = 'based on 0.00562*Li^3.07, see F1';

data.Ri = 10188/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'fisbase';   
  temp.Ri = C2K(18.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-L data
data.tL = [ ... time since birth (yr), length (cm)
    0 4.240
    1 5.553
    2 6.939
    3 8.340];
data.tL(:,1) = (data.tL(:,1) + 0.75) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'}; 
temp.tL    = C2K(18.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LeonSini2000'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: Ww in g = 0.00562*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '688WN'; % Cat of Life
metaData.links.id_ITIS = '166024'; % ITIS
metaData.links.id_EoL = '46566595'; % Ency of Life
metaData.links.id_Wiki = 'Atherina_boyeri'; % Wikipedia
metaData.links.id_ADW = 'Atherina_boyeri'; % ADW
metaData.links.id_Taxo = '44694'; % Taxonomicon
metaData.links.id_WoRMS = '272027'; % WoRMS
metaData.links.id_fishbase = 'Atherina-boyeri'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{https://en.wikipedia.org/wiki/Atherina_boyeri}}'];
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
bibkey = 'LeonSini2000'; type = 'Article'; bib = [ ... 
'author = {Ioannis Leonardos and Apostolos Sinis}, ' ... 
'year = {2000}, ' ...
'title = {Age, growth and mortality of \emph{Atherina boyeri} {R}isso, 1810 ({P}isces: {A}therinidae) in the {M}esolongi and {E}tolikon lagoons ({W}. {G}reece)}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {45}, ' ...
'pages = {81-91}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DulcGrub2008'; type = 'Article'; bib = [ ... 
'author = {Jakov Dul\v{c}i\''{c} and Leon Grubi\v{s}i\''{c} and Armin Pallaoro and Branko Glamuzina}, ' ... 
'year = {2008}, ' ...
'title = {Embryonic and larval development of big-scale sand smelt \emph{Atherina boyeri} ({A}therinidae)}, ' ...
'journal = {Cybium}, ' ...
'volume = {32}, ' ...
'pages = {27-32}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [...
'howpublished = {\url{http://www.fishbase.se/summary/Atherina-boyeri.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

