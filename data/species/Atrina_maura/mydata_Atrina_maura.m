function [data, auxData, metaData, txtData, weights] = mydata_Atrina_maura
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Pterioida'; 
metaData.family     = 'Pinnidae';
metaData.species    = 'Atrina_maura'; 
metaData.species_en = 'Pen shell'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 02 15]; 

%% set data
% zero-variate data

data.am = 3*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 23.3;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'CamaArel2012';
data.Li  = 35;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'EscaDiar2017';

data.Wwb = 8.2e-8; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'AngeArel2015';
  comment.Wwb = 'based on egg diameter of 54 mum: pi/6*0.0054^3';
  
data.Ri  = 2e8/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate at SL 24 cm';     bibkey.Ri  = 'AngeArel2015';   
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data

% time-length
data.tL = [ ... % time since May 7(d), shell length (cm)
-55.188	3.804
69.814	8.839
133.866	9.846
249.950	13.538];
data.tL(:,1) = data.tL(:,1) + 130; % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time', 'shell length'};  
temp.tL    = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'EscaDiar2017';
comment.tL = 'temeprature is guessed';

% time-weight
data.tWw = [ ... % time since May 7(d), tissue wet weight (g)
3.658	1.163
103.960	3.198
155.940	5.407
246.035	9.186];
data.tWw(:,1) = data.tWw(:,1) + 130; % set origin at birth
units.tWw   = {'d', 'g'};  label.tWw = {'time', 'tissue wet weight'};  
temp.tWw    = C2K(20);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'EscaDiar2017';
comment.tWw = 'temeprature is guessed';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;
weights.tWw = weights.tWw * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = 'JL6X'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46467253'; % Ency of Life
metaData.links.id_Wiki = 'Atrina'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3942826'; % Taxonomicon
metaData.links.id_WoRMS = '507064'; % WoRMS
metaData.links.id_molluscabase = '507064'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Atrina}}';
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
bibkey = 'EscaDiar2017'; type = 'incollection'; bib = [ ... 
'doi = {10.5772/6813}, ' ...
'isbn = {978-953-51-3305-6}, ' ...
'author = {Ruth Escamilla-Montes and Genaro Diarte-Plata and Antonio Luna-Gonzalez and Jes\''{u}s Arturo Fierro-Coronado and H\''{e}ctor Manuel Esparza-Leal and Salvador Granados-Alcantar and C\''{e}sar Arturo Ruiz-Verdugo}, ' ... 
'year = {2017}, ' ...
'title = {Ecology, Fishery and Aquaculture in {G}ulf of {C}alifornia, {M}exico: {P}en Shell \emph{Atrina maura} ({S}owerby, 1835)}, ' ...
'booktitle  = {Organismal and Molecular Malacology}, ' ...
'editor = {Sajal Ray}, ' ...
'chapter = {1}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AngeArel2015'; type = 'article'; bib = [ ... 
'doi = {10.2983/035.034.0223}, ' ...
'author = {Marco A. Angel-Dapa and Marcial Arellano-MAart\''{i}nez and Bertha P. Ceballos-V\''{a}zquez and Miguel Robles-Mungaray and Eloisa Robles-Rocha and Marian A. Camacho-Mondrag\''{o}n and Pedro E. Saucedo}, ' ... 
'year = {2015}, ' ...
'title = {REPRODUCTIVE AND LARVAL PERFORMANCE OF THE PEN SHELL \emph{Atrina maura} IN RELATION TO THE ORIGIN AND CONDITION OF BROODSTOCK}, ' ...
'journal  = {Journal of Shellfish Research}, ' ...
'volume = {34(2)}, ' ...
'pages = {401-408}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CamaArel2012'; type = 'article'; bib = [ ... 
'doi = {10.3989/scimar.03522.05A}, ' ...
'author = {Marian A. Camacho-Mondrag\''{o}n and Marcial Arellano-Mart\''{i}nez and Betha P. Ceballos-V\''{a}zquez}, ' ... 
'year = {2012}, ' ...
'title = {Particular features of gonadal maturation and size at first maturity in \emph{Atrina maura} ({B}ivalvia: {P}innidae)}, ' ...
'journal  = {Scientia Marina September, Barcelona (Spain)}, ' ...
'volume = {76(3)}, ' ...
'pages = {539-548}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

