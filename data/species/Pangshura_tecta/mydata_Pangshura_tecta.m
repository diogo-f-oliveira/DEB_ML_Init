function [data, auxData, metaData, txtData, weights] = mydata_Pangshura_tecta
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Geoemydidae';
metaData.species    = 'Pangshura_tecta'; 
metaData.species_en = 'Indian roofed turtle';

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0bTd', 'biFp', 'biFl'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'piO'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 05 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 05 02];

%% set data
% zero-variate data

data.ab = 100;     units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'Wiki';   
  temp.ab = C2K(29);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = '70-144 d';
data.am = 11*365;     units.am = 'd';    label.am = 'life span';           bibkey.am = 'AnAge';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'seems very short';

data.Lb = 3.52; units.Lb = 'cm';   label.Lb = 'carapace length at birth';      bibkey.Lb = 'Vyas1979';
data.Lp = 7.44; units.Lp = 'cm';   label.Lp = 'carapace length at puberty';      bibkey.Lp = 'Vyas1979';
data.Lpm = 6.5; units.Lpm = 'cm';   label.Lpm = 'carapace length at puberty for males';      bibkey.Lpm = 'Vyas1979';
data.Li = 22.9; units.Li = 'cm';   label.Li = 'ultimate carapace length';      bibkey.Li = 'Wiki';
data.Lim = 20; units.Lim = 'cm';   label.Lim = 'ultimate carapace length for males';      bibkey.Lim = 'guess';
  comment.Lim = 'based on "males are somewhat smaller than females"';

data.Wwb = 9.14; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Vyas1979';
data.Wwi = 1795; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'EoL';

data.Ri  = 12/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3-14 eggs er clutch, 1 clutche per yr';
 
% uni-variate data

% time-length
data.tL = [ ... % time since birth (yr), carapace length (cm)
0  3.52
1  5.73
2  6.50
3  7.44
4  8.43
5 10.45];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'carapace length'};  
temp.tL    = C2K(24);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Vyas1979';
comment.tL = 'temp is guessed';

% time-weight
data.tWw = [ ... % time since birth (yr), wet weight (g)
    0   9.14
    1  36.60
    2  51.60
    3  71.60
    4 103.00
    5 182.50];
data.tWw(:,1) = data.tWw(:,1) * 365; % convert yr to d
units.tWw   = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw    = C2K(24);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'Vyas1979';
comment.tWw = 'temp is guessed';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Lim = 3 * weights.Lim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; units.psd.k = ''; label.psd.k = 'maintenance ratio';

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';   
D2 = 'temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '75L7N'; % Cat of Life
metaData.links.id_ITIS = '949168'; % ITIS
metaData.links.id_EoL = '793088'; % Ency of Life
metaData.links.id_Wiki = 'Pangshura_tecta'; % Wikipedia
metaData.links.id_ADW = 'Pangshura_tecta'; % ADW
metaData.links.id_Taxo = '1685687'; % Taxonomicon
metaData.links.id_WoRMS = '1055800'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Pangshura&species=tecta'; % ReptileDB
metaData.links.id_AnAge = 'Pangshura_tecta'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pangshura_tecta}}';
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
bibkey = 'Vyas1979'; type = 'Article'; bib = [ ... 
'author = {Raju Vyas}, ' ... 
'year = {1979}, ' ...
'title = {Notes on growth and maturity in the {I}ndian roofed turtle (\emph{Kachuga tecta})}, ' ...
'journal = {Bombay Natural Hist, Society}, ' ...
'volume = {94)}, ' ...
'pages = {160-162}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Pangshura_tecta}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/793088}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

